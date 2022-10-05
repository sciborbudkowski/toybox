import UIKit
import Combine
import CombineCocoa
import FirebaseAuth

class ForgotPasswordViewController: ViewController {

    let customView = ForgotPasswordView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground
    }

    override func loadView() {
        view = customView
    }

    override func setupCombineComponents() {
        customView.cancelButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }.store(in: &cancellables)

        customView.remindButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }

            self.customView.activity.isHidden = false
            self.customView.activity.startAnimating()
            guard let email = self.customView.usernameField.text else {
                self.showErrorAlert(button: "OK", title: "Error", message: "Email address can't be empty.")
                self.customView.activity.isHidden = true
                self.customView.activity.stopAnimating()
                return
            }

            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    self.customView.activity.stopAnimating()
                    self.customView.activity.isHidden = true
                    self.showErrorAlert(button: "OK", title: "Error", message: "Error creating account: \(error.localizedDescription)")
                    return
                }

                self.dismiss(animated: true)
            }
        }.store(in: &cancellables)
    }
}
