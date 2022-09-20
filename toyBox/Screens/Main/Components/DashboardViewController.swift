import UIKit
import Combine
import CombineCocoa

class DashboardViewController: ViewController {

    let customView = DashboardView()

    var toysRecent: ToysModel?
    var toysPopular: ToysModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Dashboard"

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        getDataFromApi()
    }

    override func loadView() {
        view = customView
    }

    override func setupCombineComponents() {
        customView.featuredCategoriesTileView.allButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }

            let categoriesViewController = CategoriesViewController()
            self.navigationController?.pushViewController(categoriesViewController, animated: true)
        }
        .store(in: &cancellables)

        customView.refreshControl.isRefreshingPublisher.sink { [weak self] _ in
            self?.getDataFromApi(withoutLoader: true)
            self?.customView.refreshControl.endRefreshing()
        }
        .store(in: &cancellables)
    }

    private func getDataFromApi(withoutLoader: Bool = false) {
        let loader = LoaderViewController()

        if !withoutLoader {
            loader.prepare()
            tabBarController?.present(loader, animated: true)
        }

        apiClient.dispatch(InitialData(userId: Secrets.shared.userId))
            .delay(for: 1.0, scheduler: RunLoop.main)
            .tryMap { $0 }
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    DispatchQueue.main.async {
                        if !withoutLoader {
                            loader.dismiss(animated: true)
                        }
                        self.showErrorAlert(button: "OK", title: "Error", message: error.localizedDescription)
                    }
                case .finished: break
                }
            }, receiveValue: { [weak self] received in
                guard let self = self else { return }

                self.updatePopularTiles(with: received.popularToys)
                self.updateRecentTiles(with: received.recentToys)
                self.updateFeaturedCategories(with: received.categories)

                Storage.shared.cart = CartModel(result: true, type: "cart", count: received.cart.count, data: received.cart)
                Storage.shared.favorities = FavoriteModel(result: true, type: "favorities", data: received.favorities)

                DispatchQueue.main.async {
                    self.customView.insideViews.forEach { $0.isHidden = false }

                    let cartBarItem = self.tabBarController?.tabBar.items?.first { $0.title == "Cart" }
                    cartBarItem?.badgeColor = UIColor(named: "TabBarBadge")
                    let cartItemsCount = Storage.shared.cart.count
                    (cartItemsCount == 0) ? (cartBarItem?.badgeValue = nil) : (cartBarItem?.badgeValue = String(cartItemsCount))

                    let favoritiesBarItem = self.tabBarController?.tabBar.items?.first { $0.title == "Favorities" }
                    favoritiesBarItem?.badgeColor = UIColor(named: "TabBarBadge")
                    let favoritiesItemsCount = Storage.shared.favorities.data.count
                    (favoritiesItemsCount == 0) ? (favoritiesBarItem?.badgeValue = nil) : (favoritiesBarItem?.badgeValue = String(favoritiesItemsCount))

                    if !withoutLoader {
                        loader.dismiss(animated: true)
                    }
                }
            })
            .store(in: &cancellables)
    }

    private func updatePopularTiles(with model: [ToyModel]) {
        toysPopular = ToysModel(result: true, type: .popular, count: model.count, data: model)
        let max = model.count < 4 ? model.count : 3

        for index in 0...max {
            var image: String? = nil

            if model[index].images.count > 0 {
                image = model[index].images[0]
            }

            let button = TileButtonModel(title: model[index].name, subTitle: model[index].description, image: image)

            DispatchQueue.main.async {
                self.customView.popularTileView.buttons[index].configure(with: button)
                self.customView.popularTileView.buttons[index].gesture().sink { _ in
                    let toyViewController = ToyViewController()
                    toyViewController.configure(with: model[index])

                    self.navigationController?.pushViewController(toyViewController, animated: true)
                }.store(in: &self.cancellables)
            }
        }
    }

    private func updateRecentTiles(with model: [ToyModel]) {
        toysRecent = ToysModel(result: true, type: .popular, count: model.count, data: model)
        let max = model.count < 4 ? model.count : 3

        for index in 0...max {
            var image: String? = nil

            if model[index].images.count > 0 {
                image = model[index].images[0]
            }

            let button = TileButtonModel(title: model[index].name, subTitle: model[index].description, image: image)

            DispatchQueue.main.async {
                self.customView.recentTileView.buttons[index].configure(with: button)
                self.customView.recentTileView.buttons[index].gesture().sink { _ in
                    let toyViewController = ToyViewController()
                    toyViewController.configure(with: model[index])

                    self.navigationController?.pushViewController(toyViewController, animated: true)
                }.store(in: &self.cancellables)
            }
        }
    }

    private func updateFeaturedCategories(with model: [CategoryModel]) {
        let max = model.count < 4 ? model.count : 3

        for index in 0...max {
            let button = TileButtonModel(title: model[index].name,
                                         subTitle: "",
                                         image: "https://picsum.photos/301/300")
            DispatchQueue.main.async {
                self.customView.featuredCategoriesTileView.buttons[index].configure(with: button)
            }
        }
    }
}
