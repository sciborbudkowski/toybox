import UIKit
import FirebaseCore
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit

class SettingsViewController: ViewController {

    let customView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Settings"

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func loadView() {
        view = customView
    }

    override func setupCombineComponents() {
        customView.signOffButton.tapPublisher.sink { [weak self] _ in
            self?.signOut()
            self?.navigationController?.popToRootViewController(animated: true)
        }.store(in: &cancellables)
    }

    private func signOut() {
        do {
            try Auth.auth().signOut()
            AccessToken.current = nil
        } catch let error {
            showErrorAlert(button: "OK", title: "Error", message: "Error signing out: \(error.localizedDescription)")
        }
    }
}