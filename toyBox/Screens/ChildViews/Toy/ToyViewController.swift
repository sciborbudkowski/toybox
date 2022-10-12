import UIKit
import CombineCocoa

final class ToyViewController: ViewController {

    private let customView = ToyView()
    private let dataSource = ToyDataSource()

    private var data: ToyModel?
    private var images: [String] = []
    private var currentIndex: Int = 0
    private var updateViewCount: Bool = false

    convenience init(updateViewCount: Bool = false) {
        self.init()
        self.updateViewCount = updateViewCount
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        if let name = data?.name {
            title = name
        }

        customView.mainTableView.delegate = dataSource
        customView.mainTableView.dataSource = dataSource

        customView.carouselView.configure(with: images)
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

        apiClient.dispatch(Toy(toyId: data.id, updateViewCount: updateViewCount))
            .map { $0.data }
            .sink(receiveCompletion: { _ in
            }, receiveValue: { [weak self] received in
                guard let self = self else { return }
                guard let toyData = received.first else {
                    self.showErrorAlert(button: "OK", title: "Error", message: "No data received.")
                    return
                }

                self.images = toyData.images

                if toyData.images.count == 0 {
                    DispatchQueue.main.async {
                        self.customView.carouselView.disableArrows()
                        self.customView.carouselView.configure(with: UIImage(named: "NoImage")!)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.customView.carouselView.configure(with: toyData.images)
                    }
                }
            })
            .store(in: &cancellables)

        addGestures()
        addTapPublishers()
    }
}

private extension ToyViewController {

    func configure(with model: ToyModel) {
        data = model
        guard let data = data else { return }

        let general: [ToyPropertyType] = [
            ToyPropertyType(name: "Name:", value: data.name),
            ToyPropertyType(name: "", value: data.description),
            ToyPropertyType(name: "Price:", value: String(data.price)),
            ToyPropertyType(name: "Brand", value: data.brand),
            ToyPropertyType(name: "Gender", value: data.gender == 0 ? "Any" : data.gender == -1 ? "Girl" : "Boy"),
            ToyPropertyType(name: "Age min:", value: String(data.ageMin))
        ]

        let location: [ToyPropertyType] = [
            ToyPropertyType(name: "City", value: data.location.placeName)
        ]

        let statistics: [ToyPropertyType] = [
            ToyPropertyType(name: "View count:", value: String(data.viewCount))
        ]

        let sections: [ToyPropertySections] = [
            ToyPropertySections(sectionName: "General", properties: general),
            ToyPropertySections(sectionName: "Location", properties: location),
            ToyPropertySections(sectionName: "Statistics", properties: statistics)
        ]

        dataSource.sections = sections
        customView.mainTableView.reloadData()

        customView.nameLabel.text = data.name

        let isFavorite = Storage.shared.favorites.data.contains { item in
            if item.userId == Secrets.shared.userId, item.toyId == model.id {
                return true
            }
            return false
        }

        let imageName = isFavorite ? "heart.fill" : "heart"
        let button = UIBarButtonItem(image: UIImage(systemName: imageName), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = button

        navigationItem.rightBarButtonItem?.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }

            self.switchFavoriteStatus()
        }
        .store(in: &cancellables)
    }

    func switchFavoriteStatus() {
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

    func swipeToPrevious() {
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = images.count - 1
        }

        customView.carouselView.scrollContent(index: currentIndex)
    }

    func swipeToNext() {
        currentIndex += 1
        if currentIndex == images.count {
            currentIndex = 0
        }

        customView.carouselView.scrollContent(index: currentIndex)
    }

    func addGestures() {
        customView.carouselView.gesture(.swipeLeft()).sink { [weak self] _ in
            guard let self = self else { return }
            if self.currentIndex != 0 {
                self.swipeToPrevious()
            }
        }.store(in: &cancellables)

        customView.carouselView.gesture(.swipeRight()).sink { [weak self] _ in
            guard let self = self else { return }
            if self.currentIndex < self.images.count - 1 {
                self.swipeToNext()
            }
        }.store(in: &cancellables)
    }

    func addTapPublishers() {
        customView.carouselView.previousButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.swipeToPrevious()
        }.store(in: &cancellables)

        customView.carouselView.nextButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.swipeToNext()
        }.store(in: &cancellables)
    }
}
