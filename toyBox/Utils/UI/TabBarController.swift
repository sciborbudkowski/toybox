import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let items = tabBar.items {
            items.forEach { item in item.imageInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30) }
        }

        tabBar.itemWidth = 30.0
        tabBar.itemSpacing = 50.0
        tabBar.itemPositioning = .centered
        tabBar.barTintColor = UIColor(named: "Accent")
    }
}
