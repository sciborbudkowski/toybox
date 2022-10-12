import UIKit

final class CartViewController: ViewController {

    private let customView = CartView()

    private var cartItems: CartModel = Storage.shared.cart

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
