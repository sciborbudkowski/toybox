import UIKit
import Kingfisher

class ToyViewController: MainViewController {

    let customView = ToyView()
    let dataSource = ToyDataSource()

    private var data: ToyModel?

    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func setupCombineComponents() {
        guard let data = data else { fatalError("this shouldn't happen!") }
        apiClient.dispatch(IsFavorities(userId: Secrets.shared.userId, toyId: data.id))
            .map { $0 }
            .sink { _ in
            } receiveValue: { [weak self] received in
                guard let self = self else { return }
                let state = received.data.count == 0 ? false : true
                let imageName = state ? "heart.fill" : "heart"
                let button = UIBarButtonItem(image: UIImage(systemName: imageName), style: .plain, target: nil, action: nil)
                DispatchQueue.main.async {
                    self.navigationItem.rightBarButtonItem = button
                    self.navigationItem.rightBarButtonItem?.tapPublisher.sink(receiveValue: { _ in
                        self.switchFavoriteStatus()
                    }).store(in: &self.cancellables)
                }
            }
            .store(in: &cancellables)
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

        let sections: [ToyPropertySections] = [
            ToyPropertySections(sectionName: "General", properties: properties),
            ToyPropertySections(sectionName: "Test", properties: properties)
        ]

        dataSource.sections = sections
        customView.mainTableView.reloadData()

        customView.nameLabel.text = data.name
        customView.imageView.kf.setImage(with: URL(string: data.image))
    }

    private func switchFavoriteStatus() {
        guard let data = data else { fatalError("this shouldn't happen!") }

        apiClient.dispatch(SwitchFavorite(userId: Secrets.shared.userId, toyId: data.id))
            .sink { _ in
            } receiveValue: { [weak self] received in
                guard let self = self else { return }
                if received.result {
                    let imageName = received.operation == "add" ? "heart.fill" : "heart"
                    DispatchQueue.main.async {
                        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: imageName)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
