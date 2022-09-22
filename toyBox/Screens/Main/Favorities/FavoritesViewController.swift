import UIKit

class FavoritesViewController: ViewController {

    let customView = FavoritesView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Favorites"

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func loadView() {
        view = customView
    }
}
