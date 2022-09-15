import UIKit

class SwipeableImageView: View {

    let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private var indicator: PageIndicatorView?
    private var itemsCount: Int

    let leftButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "arrowtriangle.backward.fill")
        config.baseForegroundColor = UIColor(named: "Accent")

        let button = UIButton(configuration: config)
        return button
    }()

    let rightButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "arrowtriangle.forward.fill")
        config.baseForegroundColor = UIColor(named: "Accent")

        let button = UIButton(configuration: config)
        return button
    }()

    init(itemsCount: Int) {
        self.indicator = PageIndicatorView(itemsCount: itemsCount, currentIndex: 0)
        self.itemsCount = itemsCount

        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(image: UIImage, currentIndex: Int) {
        imageView.image = image
        indicator = PageIndicatorView(itemsCount: itemsCount, currentIndex: currentIndex)
    }

    override func setupConstraints() {
        guard let indicator = indicator else { return }

        addSubviews([imageView, leftButton, rightButton, indicator])
        constraintToAllEdges()

        leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        leftButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        rightButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        rightButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        indicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
