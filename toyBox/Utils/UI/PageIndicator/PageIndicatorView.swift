import UIKit

class PageIndicatorView: View {

    var currentIndex: Int = 0
    var itemsCount: Int?
    var color: UIColor?
    var indicators: [PageIndicatorItem] = []

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .trailing
        view.distribution = .equalSpacing
        view.spacing = 5.0
        return view
    }()

    init(itemsCount: Int, currentIndex: Int = 0, color: UIColor = UIColor(named: "Accent")!) {
        self.itemsCount = itemsCount
        self.currentIndex = currentIndex
        self.color = color

        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupProperties() {
        guard let itemsCount = itemsCount,
              let color = color
        else { return }

        for i in 0...itemsCount - 1 {
            let type: PageIndicatorType = i == currentIndex ? .wide : .dot
            let item = PageIndicatorItem(type: type, color: color)
            indicators.append(item)
        }
    }

    override func setupConstraints() {
        print(indicators)

        addSubviews([stackView])

        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        indicators.forEach {
            stackView.addArrangedSubview($0)
        }
    }
}

