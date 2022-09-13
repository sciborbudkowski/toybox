import UIKit

enum PageIndicatorType {
    case wide
    case dot
}

class PageIndicatorItem: View {

    private var type: PageIndicatorType
    private var color: UIColor

    private let indicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3.0
        return view
    }()

    init(type: PageIndicatorType, color: UIColor = UIColor(named: "Accent")!) {
        self.type = type
        self.color = color

        indicatorView.backgroundColor = color
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupConstraints() {
        addSubviews([indicatorView])

        switch type {
        case .dot:
            indicatorView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        case .wide:
            indicatorView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        }

        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
}
