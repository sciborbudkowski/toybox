import UIKit
import Combine
import CombineCocoa

class MainViewController: ViewController {

    lazy var apiClientQueue = DispatchQueue(label: "apiClientQueue")
    lazy var apiClient = ApiClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
