import UIKit
import Combine
import CombineCocoa
import FirebaseCore
import FirebaseAuth

class SignUpViewController: ViewController {

    let customView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    override func loadView() {
        view = customView
    }

    override func setupCombineComponents() {
        customView.cancelButton.tapPublisher.sink { [weak self] _ in
            self?.dismiss(animated: true)
        }.store(in: &cancellables)

        customView.signupButton.tapPublisher.sink { [weak self] _ in
            guard let email = self?.customView.usernameField.text, email.isEmailAddressValid() else {
                self?.showErrorAlert(button: "OK", title: "Error", message: "Email address is either empty or incorrect.")
                return
            }

            guard let password1 = self?.customView.passwordField.text,
                  let password2 = self?.customView.confirmPasswordField.text,
                  password1.count >= 6 else {
                self?.showErrorAlert(button: "OK", title: "Error", message: "Password must be at least 6 characters long.")
                return
            }

            if password1 != password2 {
                self?.showErrorAlert(button: "OK", title: "Error", message: "Passwords don't match.")
                return
            }

            self?.customView.activity.isHidden = false
            self?.customView.activity.startAnimating()

            Auth.auth().createUser(withEmail: email, password: password1) { [weak self] result, error in
                if let error = error {
                    self?.customView.activity.stopAnimating()
                    self?.customView.activity.isHidden = true
                    self?.showErrorAlert(button: "OK", title: "Error", message: "Error creating account: \(error.localizedDescription)")
                    return
                }

                self?.dismiss(animated: true)
            }
        }.store(in: &cancellables)
    }
}
