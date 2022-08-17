import UIKit
import Combine
import CombineCocoa

class DashboardViewController: ViewController {

    let customView = DashboardView()

    var apiClientQueue = DispatchQueue(label: "apiClientQueue")

    var apiClient = ApiClient(baseURL: Settings.shared.apiBaseUrl)

    var toysRecent: ToysModel?
    var toysPopular: ToysModel?

    let loader = LoaderViewController()

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

    private func getToysPopular() -> AnyPublisher<ToysModel, NetworkRequestError> {
        return apiClient.dispatch(ToysPopular())
            .delay(for: 1.0, scheduler: apiClientQueue)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private func getToysRecent() -> AnyPublisher<ToysModel, NetworkRequestError> {
        return apiClient.dispatch(ToysRecent())
            .delay(for: 1.0, scheduler: apiClientQueue)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    private func getDataFromApi() {
        Publishers.Merge(
            getToysPopular(),
            getToysRecent()
        ).map { toys in
            print(toys)
        }.sink(receiveCompletion: { _ in }, receiveValue: { _ in }
        ).store(in: &cancellables)

    }
}
