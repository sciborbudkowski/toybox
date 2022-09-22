import UIKit

class LoaderViewController: ViewController {

    let customView = LoaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "Background")!.withAlphaComponent(0.65)
    }

    override func loadView() {
        view = customView
    }

    func prepare() {
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .custom
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        customView.loadingIndicator.startAnimating()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        customView.loadingIndicator.stopAnimating()
    }
}
