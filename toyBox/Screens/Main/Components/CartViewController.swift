import UIKit

class CartViewController: MainViewController {

    let customView = CartView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Cart"

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func loadView() {
        view = customView
    }
}
