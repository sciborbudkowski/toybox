import UIKit
import Combine

class ViewController: UIViewController {

    lazy var apiClientQueue = DispatchQueue(label: "apiClientQueue")
    lazy var apiClient = ApiClient()
    
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

    func updateTabBarBadgeValues() {
        let cartBarItem = self.tabBarController?.tabBar.items?.first { $0.title == "Cart" }
        let favoritesBarItem = self.tabBarController?.tabBar.items?.first { $0.title == "Favorites" }

        cartBarItem?.badgeColor = UIColor(named: "TabBarBadge")
        favoritesBarItem?.badgeColor = UIColor(named: "TabBarBadge")

        (Storage.shared.cart.count == 0) ? (cartBarItem?.badgeValue = nil) : (cartBarItem?.badgeValue = String(Storage.shared.cart.count))
        (Storage.shared.favorites.data.count == 0) ? (favoritesBarItem?.badgeValue = nil) : (favoritesBarItem?.badgeValue = String(Storage.shared.favorites.data.count))
    }
}
