import UIKit

class CartViewController: MainViewController {

    let customView = CartView()

    var cartItems: CartModel = Storage.shared.cart

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Cart"

        navigationController?.setNavigationBarHidden(true, animated: false)

        print("CartVC cartItems.count = ", cartItems.count)
    }

    override func loadView() {
        view = customView
    }
}
