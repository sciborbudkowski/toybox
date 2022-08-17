import UIKit

class LoaderViewController: ViewController {

    let customView = LoaderView()

    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "Background")!.withAlphaComponent(0.75)
    }

    override func loadView() {
        view = customView
    }

    public func start() {
        customView.loadingIndicator.startAnimating()
    }

    public func stop() {
        customView.loadingIndicator.stopAnimating()
        dismiss(animated: true)
    }
}
