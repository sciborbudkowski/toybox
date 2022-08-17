import UIKit
import Combine
import CombineCocoa

class DashboardViewController: ViewController {

    let customView = DashboardView()

    var apiClientQueue = DispatchQueue(label: "apiClientQueue")

    var apiClient = ApiClient(baseURL: Settings.shared.apiBaseUrl)

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

    }

//    private func getToysPopular() -> AnyPublisher<ToysModel, NetworkRequestError> {
//        return apiClient.dispatch(ToysPopular())
//            .delay(for: 1.0, scheduler: apiClientQueue)
//            .map { $0 }
//            .eraseToAnyPublisher()
//    }
//
//    private func getToysRecent() -> AnyPublisher<ToysModel, NetworkRequestError> {
//        return apiClient.dispatch(ToysRecent())
//            .delay(for: 1.0, scheduler: apiClientQueue)
//            .map { $0 }
//            .eraseToAnyPublisher()
//    }
//
//    private func getCategories() -> AnyPublisher<CategoriesModel, NetworkRequestError> {
//        return apiClient.dispatch(Categories())
//            .delay(for: 1.0, scheduler: apiClientQueue)
//            .map { $0 }
//            .eraseToAnyPublisher()
//    }

    private func getDataFromApi() {
        let loader = LoaderViewController()
        loader.modalTransitionStyle = .crossDissolve
        loader.modalPresentationStyle = .custom
        loader.start()
        present(loader, animated: true)

        apiClient.dispatch(InitialData())
            .map { $0 }
            .sink { _ in
                DispatchQueue.main.async {
                    loader.dismiss(animated: true)
                }
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.updatePopularTiles(with: data.popularToys)
                self.updateRecentTiles(with: data.recentToys)
                self.updateFeaturedCategories(with: data.categories)

                DispatchQueue.main.async {
                    self.customView.tileViews.forEach { $0.isHidden = false }
                }
            }
            .store(in: &cancellables)
    }

    private func updatePopularTiles(with model: [ToyModel]) {
        let max = model.count < 4 ? model.count : 3

        for index in 0...max {
            let button = TileButtonModel(title: model[index].name,
                                         subTitle: model[index].description,
                                         image: model[index].image)
            DispatchQueue.main.async {
                self.customView.popularTileView.buttons[index].configure(with: button)
            }
        }
    }

    private func updateRecentTiles(with model: [ToyModel]) {
        let max = model.count < 4 ? model.count : 3

        for index in 0...max {
            let button = TileButtonModel(title: model[index].name,
                                         subTitle: model[index].description,
                                         image: model[index].image)
            DispatchQueue.main.async {
                self.customView.recentTileView.buttons[index].configure(with: button)
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
