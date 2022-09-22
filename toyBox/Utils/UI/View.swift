import UIKit

class View: UIView {

    internal let distanceFromEdge: CGFloat = CGFloat(Settings.shared.distanceFromEdge)
    internal let distanceBetweenControls: CGFloat = CGFloat(Settings.shared.distanceBetweenControls)
    internal let distanceBetweenGroups: CGFloat = CGFloat(Settings.shared.distanceBetweenGroups)

    init() {
        super.init(frame: .zero)
        setupProperties()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupProperties() {
    }

    func setupConstraints() {
    }
}
