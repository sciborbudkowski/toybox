import UIKit
import Kingfisher

struct TileButtonModel {
    var title: String
    var subTitle: String?
    var image: String?
}

class TileButton: View {

    private var shadowLayer: CAShapeLayer?

    let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()

    let titleLabel: Label = {
        let label = Label()
        label.font = UIFont.fontKarla(.regular, ofSize: 16)
        label.text = ""
        label.textColor = .black
        label.backgroundColor = .lightGray.withAlphaComponent(0.5)
        label.paddingLeft = 2.0
        label.paddingRight = 2.0
        return label
    }()

    let subTitleLabel: Label = {
        let label = Label()
        label.font = UIFont.fontKarla(.regular, ofSize: 12)
        label.text = ""
        label.textColor = .black
        label.backgroundColor = .lightGray.withAlphaComponent(0.5)
        label.paddingLeft = 2.0
        label.paddingRight = 2.0
        return label
    }()

    override func setupConstraints() {
        addSubviews([backgroundImageView, titleLabel, subTitleLabel])

        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        subTitleLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -5).isActive = true
        subTitleLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -5).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: -5).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer?.path = UIBezierPath(roundedRect: bounds, cornerRadius: 10).cgPath
            shadowLayer?.fillColor = UIColor.clear.cgColor

            shadowLayer?.shadowColor = UIColor.darkGray.cgColor
            shadowLayer?.shadowPath = shadowLayer?.path
            shadowLayer?.shadowOffset = CGSize(width: 5.0, height: 5.0)
            shadowLayer?.shadowOpacity = 0.7
            shadowLayer?.shadowRadius = 5.0

            guard let shadowLayer = shadowLayer else { return }
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }

    func configure(with model: TileButtonModel) {
        titleLabel.text = model.title

        if let image = model.image {
            backgroundImageView.kf.setImage(with: URL(string: image))
        } else {
            backgroundImageView.image = UIImage(named: "NoImage")
        }

        if let subTitle = model.subTitle {
            subTitleLabel.text = subTitle
        } else {
            subTitleLabel.isHidden = true
        }
    }
}
