import UIKit

class SearchFilterViewController: ViewController {

    let customView = SearchFilterView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    override func loadView() {
        view = customView
    }
}
