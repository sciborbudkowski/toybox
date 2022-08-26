import UIKit
import Kingfisher

class ToyViewController: ViewController {

    let customView = ToyView()
    let dataSource = ToyDataSource()

    private var data: ToyModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        Settings.shared.isBackFromChildController = true

        view.backgroundColor = .systemBackground
        if let name = data?.name {
            title = name
        }

        customView.mainTableView.delegate = dataSource
        customView.mainTableView.dataSource = dataSource
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

        let properties: [ToyPropertyType] = [
            ToyPropertyType(name: "Added:", value: data.dateAdded),
            ToyPropertyType(name: "View count:", value: String(data.viewCount)),
            ToyPropertyType(name: "Price:", value: String(data.price)),
            ToyPropertyType(name: "Gender", value: data.gender == 0 ? "none" : data.gender == -1 ? "girl" : "boy"),
            ToyPropertyType(name: "Brand", value: data.brand),
            ToyPropertyType(name: "Age min:", value: String(data.ageMin))
        ]

        let sections: [ToyPropertySections] = [ToyPropertySections(sectionName: "General", properties: properties)]

        dataSource.sections = sections
        customView.mainTableView.reloadData()

        customView.nameLabel.text = data.name
        customView.imageView.kf.setImage(with: URL(string: data.image))
    }

    @objc private func backToPreviousController() {
        navigationController?.popViewController(animated: true)
    }
}
