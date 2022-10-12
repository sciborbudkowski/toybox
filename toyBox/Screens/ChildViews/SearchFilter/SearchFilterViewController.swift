import UIKit

final class SearchFilterViewController: ViewController {

    private let customView = SearchFilterView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    override func loadView() {
        view = customView
    }
}
