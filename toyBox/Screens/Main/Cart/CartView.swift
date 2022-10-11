import UIKit

class CartView: MainFlatView {

    var items: [ToyModel] = []
//    {
//        didSet {
//            if items.isEmpty {
//                emptyView.isHidden = false
//                cartView.isHidden = true
//            } else {
//                emptyView.isHidden = true
//                cartView.isHidden = false
//            }
//        }
//    }
    private let viewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 22)
        label.text = "Favorite Toys"
        label.textColor = UIColor(named: "Accent")
        return label
    }()

    private let emptyView = UIView()
    private let normalView = UIView()

    private let emptyCartLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 18)
        label.text = "The cart is empty."
        label.textColor = UIColor(named: "Info")
        return label
    }()

    private let emptyCardImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "EmptyCart")
        return view
    }()

    override func setupConstraints() {
        contentView.addSubviews([emptyView, normalView])
        emptyView.addSubviews([emptyCartLabel, emptyCardImage])

//        emptyCartLabel.centerYAnchor.constraint(equalTo: insideView.centerYAnchor).isActive = true
//        emptyCartLabel.centerXAnchor.constraint(equalTo: insideView.centerXAnchor).isActive = true
//        emptyView.isHidden = false
//        cartView.isHidden = true
//
//        insideView.addSubviews([emptyView])
//
//        emptyView.topAnchor.constraint(equalTo: insideView.topAnchor).isActive = true
//        emptyView.bottomAnchor.constraint(equalTo: insideView.bottomAnchor).isActive = true
//        emptyView.leadingAnchor.constraint(equalTo: insideView.leadingAnchor).isActive = true
//        emptyView.trailingAnchor.constraint(equalTo: insideView.trailingAnchor).isActive = true
//        emptyView.layer.borderColor = UIColor.blue.cgColor
//        emptyView.layer.borderWidth = 2
//
//        cartView.topAnchor.constraint(equalTo: insideView.topAnchor).isActive = true
//        cartView.bottomAnchor.constraint(equalTo: insideView.bottomAnchor).isActive = true
//        cartView.leadingAnchor.constraint(equalTo: insideView.leadingAnchor).isActive = true
//        cartView.trailingAnchor.constraint(equalTo: insideView.trailingAnchor).isActive = true
//
//        emptyView.addSubviews([emptyCartLabel, emptyCardImage])
//
//        emptyCardImage.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
//        emptyCardImage.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -50).isActive = true
//
//        emptyCartLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
//        emptyCartLabel.topAnchor.constraint(equalTo: emptyCardImage.bottomAnchor, constant: 10).isActive = true
    }
}
