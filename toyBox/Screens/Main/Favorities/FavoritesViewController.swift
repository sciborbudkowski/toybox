import UIKit

class FavoritesViewController: ViewController {

    let customView = FavoritesView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Favorites"

        navigationController?.setNavigationBarHidden(true, animated: false)

        getDataFromApi()
    }

    override func loadView() {
        view = customView
    }

    private func getDataFromApi(withoutLoader: Bool = false) {
        let loader = LoaderViewController()

        if !withoutLoader {
            loader.prepare()
            tabBarController?.present(loader, animated: true)
        }

        apiClient.dispatch(GetFavorities(userId: Secrets.shared.userId))
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
                DispatchQueue.main.async {
                    if !withoutLoader {
                        loader.dismiss(animated: true)
                    }
                }
            })
            .store(in: &cancellables)
    }
}
