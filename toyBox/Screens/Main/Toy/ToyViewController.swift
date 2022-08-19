import UIKit
import Kingfisher

class ToyViewController: ViewController {

    let customView = ToyView()

    private var data: ToyModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupNavigationBar()

        customView.mainTableView.delegate = self
    }

    override func loadView() {
        view = customView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func configure(with model: ToyModel) {
        data = model
        guard let data = data else { return }

        customView.nameLabel.text = data.name
        customView.imageView.kf.setImage(with: URL(string: data.image))
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(named: "Accent")
        navigationController?.navigationBar.isTranslucent = true

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToPreviousController))
    }

    @objc private func backToPreviousController() {
        navigationController?.popViewController(animated: true)
    }
}
