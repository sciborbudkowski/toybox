import UIKit
import FirebaseAuth
import FBSDKLoginKit

final class SettingsViewController: ViewController {

    private let customView = SettingsView()
    private let dataSource = SettingsDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground

        customView.settingsTableView.dataSource = dataSource
        customView.settingsTableView.delegate = dataSource
    }

    override func loadView() {
        view = customView
    }

    override func setupCombineComponents() {
        customView.signOffButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }

            self.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }.store(in: &cancellables)
    }
}

private extension SettingsViewController {

    func signOut() {
        do {
            try Auth.auth().signOut()
            AccessToken.current = nil
        } catch let error {
            showErrorAlert(button: "OK", title: "Error", message: "Error signing out: \(error.localizedDescription)")
        }
    }
}
