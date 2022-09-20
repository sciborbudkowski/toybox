import UIKit

extension UIView {

    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    func setGradientBackground(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    func constraintToAllEdges(of view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
    }
}
