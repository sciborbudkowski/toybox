import UIKit

final class CategoriesViewController: ViewController {

    private let customView = CategoriesView()
    private let dataSource = CategoriesDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        view.backgroundColor = .systemBackground
        title = "Browse by Categories"

        customView.categoriesTableView.dataSource = dataSource
        customView.categoriesTableView.delegate = dataSource

        getDataFromApi()
    }

    override func loadView() {
        view = customView
    }
}

private extension CategoriesViewController {

    func getDataFromApi() {
        let loader = LoaderViewController()
        loader.prepare()
        present(loader, animated: true)

        apiClient.dispatch(Categories())
            .delay(for: 1.0, scheduler: RunLoop.main)
            .map { $0.data }
            .sink { _ in
            } receiveValue: { [weak self] items in
                guard let self = self else { print("!!!!"); return }
                self.dataSource.items = items
                DispatchQueue.main.async {
                    self.customView.categoriesTableView.reloadData()
                    loader.dismiss(animated: true)
                }
            }
            .store(in: &cancellables)
    }
}
