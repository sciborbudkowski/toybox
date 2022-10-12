import UIKit

enum PageIndicatorType {
    case wide
    case dot
}

final class PageIndicatorItem: View {

    var type: PageIndicatorType

    private var color: UIColor

    private let indicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3.0
        return view
    }()

    init(type: PageIndicatorType, color: UIColor = UIColor(named: "Accent")!) {
        self.type = type

        switch type {
        case .dot: self.color = .systemGray5
        case .wide: self.color = color
        }

        indicatorView.backgroundColor = self.color
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupConstraints() {
        addSubviews([indicatorView])

        var widthValue: CGFloat = 0.0

        switch type {
        case .dot: widthValue = 5.0
        case .wide: widthValue = 35
        }

        indicatorView.widthAnchor.constraint(equalToConstant: widthValue).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
}
