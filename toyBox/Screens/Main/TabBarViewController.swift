import UIKit

class TabBarViewController: TabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)

        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tabBar.tintColor = UIColor(named: "ButtonInverted")
        tabBar.unselectedItemTintColor = UIColor(named: "TabBarUnselected")
        tabBar.isTranslucent = true

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.fontKarla(.regular, ofSize: 14)], for: .normal)
        UITabBarItem.appearance().setBadgeTextAttributes([NSAttributedString.Key.font: UIFont.fontKarla(.regular, ofSize: 12)], for: .normal)

        let tabDashboard = DashboardViewController()
        let tabDashboardBarItem = UITabBarItem(title: "Dashboard",
                                               image: UIImage(systemName: "music.note.house"),
                                               selectedImage: UIImage(systemName: "music.note.house.fill"))
        tabDashboard.tabBarItem = tabDashboardBarItem

        let tabFavorites = FavoritesViewController()
        let tabFavoritesBarItem = UITabBarItem(title: "Favorites",
                                               image: UIImage(systemName: "heart"),
                                               selectedImage: UIImage(systemName: "heart.fill"))
        tabFavoritesBarItem.badgeColor = UIColor(named: "TabBarBadge")
        tabFavorites.tabBarItem = tabFavoritesBarItem

        let tabCart = CartViewController()
        let tabCartBarItem = UITabBarItem(title: "Cart",
                                          image: UIImage(systemName: "cart"),
                                          selectedImage: UIImage(systemName: "cart.fill"))
        tabCartBarItem.badgeColor = UIColor(named: "TabBarBadge")
        tabCart.tabBarItem = tabCartBarItem

        let tabSettings = SettingsViewController()
        let tabSettingsBarItem = UITabBarItem(title: "Settings",
                                              image: UIImage(systemName: "gearshape"),
                                              selectedImage: UIImage(systemName: "gearshape.fill"))
        tabSettings.tabBarItem = tabSettingsBarItem

        viewControllers = [tabDashboard, tabFavorites, tabCart, tabSettings]
    }
}

extension TabBarViewController: UITabBarControllerDelegate {

}
