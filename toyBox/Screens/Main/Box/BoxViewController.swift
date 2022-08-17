import UIKit
import Combine
import CombineCocoa
import FirebaseCore
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit

class BoxViewController: ViewController {

    let customView = BoxView()

    private var authState: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        authState = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let user = user else {
                self?.dismiss(animated: true)
                return
            }
            print(user.email as Any)
            print(user.displayName as Any)
        }
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
