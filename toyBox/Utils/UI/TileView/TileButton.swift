import UIKit
import Kingfisher

struct TileButtonModel {
    var title: String
    var subTitle: String
    var image: String
}

class TileButton: View {

    let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.kf.setImage(with: URL(string: "https://placeimg.com/640/480/any"))
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.regular, ofSize: 14)
        label.text = ""
        label.textColor = .white
        return label
    }()

    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.regular, ofSize: 12)
        label.text = ""
        label.textColor = .white
        return label
    }()

    override func setupConstraints() {
        addSubviews([backgroundImageView, titleLabel, subTitleLabel])

        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        subTitleLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5).isActive = true
        subTitleLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -5).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor).isActive = true
    }

    func configure(with model: TileButtonModel) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        backgroundImageView.kf.setImage(with: URL(string: model.image))

        if model.subTitle == "" {
            subTitleLabel.isHidden = true
        }
    }
}
