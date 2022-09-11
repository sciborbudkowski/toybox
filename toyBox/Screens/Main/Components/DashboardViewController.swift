import UIKit
import Combine
import CombineCocoa

class DashboardViewController: MainViewController {

    let customView = DashboardView()

    var toysRecent: ToysModel?
    var toysPopular: ToysModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Dashboard"

        navigationController?.setNavigationBarHidden(true, animated: false)

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
        }.store(in: &cancellables)
    }

    private func getDataFromApi() {
        let loader = LoaderViewController()
        loader.prepare()
        present(loader, animated: true)

        apiClient.dispatch(InitialData(userId: Secrets.shared.userId))
            .delay(for: 1.0, scheduler: RunLoop.main)
            .sink(receiveCompletion: { (error) in
                print(error)
            }) { received in
                print(received)
            }
            .store(in: &cancellables)
//            .map { $0 }
//            .sink { c in
//                print("$$$$$$$$$$$$$$$$$$$$$", c)
//            } receiveValue: { [weak self] received in
//                guard let self = self else { return }
//
//                self.updatePopularTiles(with: received.popularToys)
//                self.updateRecentTiles(with: received.recentToys)
//                self.updateFeaturedCategories(with: received.categories)
//
//                CartStorage.shared.data = CartModel(result: true, type: "cart", count: received.cart.count, data: received.cart)
//
//                DispatchQueue.main.async {
//                    self.customView.insideViews.forEach { $0.isHidden = false }
//
//                    let cartBarItem = self.tabBarController?.tabBar.items?.first { $0.title == "Cart" }
//                    let cartItemsCount = CartStorage.shared.data.count
//                    (cartItemsCount == 0) ? (cartBarItem?.badgeValue = nil) : (cartBarItem?.badgeValue = String(cartItemsCount))
//
//                    loader.dismiss(animated: true)
//                }
//            }
//            .store(in: &cancellables)
    }

    private func updatePopularTiles(with model: [ToyModel]) {
        toysPopular = ToysModel(result: true, type: .popular, count: model.count, data: model)
        let max = model.count < 4 ? model.count : 3

        for index in 0...max {
            let button = TileButtonModel(title: model[index].name,
                                         subTitle: model[index].description,
                                         image: model[index].image)
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
            let button = TileButtonModel(title: model[index].name,
                                         subTitle: model[index].description,
                                         image: model[index].image)
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
                                         image: "https://picsum.photos/300/300")
            DispatchQueue.main.async {
                self.customView.featuredCategoriesTileView.buttons[index].configure(with: button)
            }
        }
    }
}
