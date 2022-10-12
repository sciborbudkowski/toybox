import UIKit

final class FavoritesViewController: ViewController {

    var items: [ToyModel] = []

    private let customView = FavoritesView()

    private var toysFavorites: ToysModel? {
        didSet {
            guard let data = toysFavorites?.data else { return }
            self.items = data
            customView.favoritesTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Favorites"

        navigationController?.setNavigationBarHidden(true, animated: false)

        customView.favoritesTableView.dataSource = self
        customView.favoritesTableView.delegate = self
    }

    override func loadView() {
        view = customView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        getDataFromApi()
    }

    override func setupCombineComponents() {
        customView.refreshControl.isRefreshingPublisher.sink { [weak self] _ in
            guard let self = self else { return }

            self.getDataFromApi(withoutLoader: true)
            self.customView.refreshControl.endRefreshing()
        }
        .store(in: &cancellables)
    }
}

private extension FavoritesViewController {

    func getDataFromApi(withoutLoader: Bool = false) {
        let loader = LoaderViewController()

        if !withoutLoader {
            loader.prepare()
            tabBarController?.present(loader, animated: true)
        }

        apiClient.dispatch(GetFavorites(userId: Secrets.shared.userId))
            .delay(for: 1.0, scheduler: RunLoop.main)
            .tryMap { $0.data }
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

                self.customView.isEmpty = received.isEmpty
                self.toysFavorites = ToysModel(result: true, count: received.count, data: received)
                self.updateTabBarBadgeValues()

                DispatchQueue.main.async {
                    if !withoutLoader {
                        loader.dismiss(animated: true)
                    }
                }
            })
            .store(in: &cancellables)
    }
}
