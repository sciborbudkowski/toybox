import UIKit
import CombineCocoa
import FirebaseAuth

final class SignUpViewController: ViewController {

    private let customView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    override func loadView() {
        view = customView
    }

    override func setupCombineComponents() {
        customView.cancelButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }.store(in: &cancellables)

        customView.signupButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }

            guard let email = self.customView.usernameField.text,
                  email.isThisEmailAddress() else {
                self.showErrorAlert(button: "OK", title: "Error", message: "Email address is either empty or incorrect.")
                return
            }

            guard let password1 = self.customView.passwordField.text,
                  let password2 = self.customView.confirmPasswordField.text,
                  password1.count >= 6 else {
                self.showErrorAlert(button: "OK", title: "Error", message: "Password must be at least 6 characters long.")
                return
            }

            if password1 != password2 {
                self.showErrorAlert(button: "OK", title: "Error", message: "Passwords don't match.")
                return
            }

            self.customView.activity.isHidden = false
            self.customView.activity.startAnimating()

            Auth.auth().createUser(withEmail: email, password: password1) { _, error in
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
