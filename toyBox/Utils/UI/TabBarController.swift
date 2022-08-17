import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let layer = CAShapeLayer()
//        layer.path = UIBezierPath(roundedRect: CGRect(x: 10, y: self.tabBar.bounds.minY - 5, width: self.tabBar.bounds.width - 20, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width / 2)).cgPath
//        layer.shadowColor = UIColor.darkGray.cgColor
//        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//        layer.shadowRadius = 5.0
//        layer.shadowOpacity = 0.7
//        layer.opacity = 1.0
//        layer.masksToBounds = false
//        layer.fillColor = UIColor(named: "Accent")?.cgColor

        if let items = tabBar.items {
            items.forEach { item in item.imageInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30) }
        }

//        self.tabBar.layer.insertSublayer(layer, at: 0)

        tabBar.itemWidth = 30.0
        tabBar.itemSpacing = 50.0
        tabBar.itemPositioning = .centered
        tabBar.barTintColor = UIColor(named: "Accent")
    }
}
