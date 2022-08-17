import UIKit

class FavoritesViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Favorites"

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
