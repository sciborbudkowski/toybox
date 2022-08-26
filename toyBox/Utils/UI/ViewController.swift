import UIKit
import Combine

class ViewController: UIViewController {

    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCombineComponents()
        
        navigationItem.backButtonTitle = ""
    }

    func setupCombineComponents() { }

    func showErrorAlert(button: String, title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: button, style: .cancel)

        alert.addAction(action)
        present(alert, animated: true)
    }
}
