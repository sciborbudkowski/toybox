import UIKit
import Kingfisher

struct FavoriteCellModel {
    var image: String?
    var title: String
    var place: String
    var distance: String
    var price: String
    var id: String
}

class FavoriteViewCell: TableCell {

    var model: FavoriteCellModel?

    private let image: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.semiBold, ofSize: 20)
        label.textColor = UIColor(named: "Text")
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.bold, ofSize: 22)
        label.textColor = UIColor(named: "Text")
        return label
    }()

    private let placeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        return label
    }()

    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.ligth, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        return label
    }()

    override func setupLayoutConstraints() {
        contentView.addSubviews([image, titleLabel, priceLabel, placeLabel, distanceLabel])

        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        image.widthAnchor.constraint(equalToConstant: 75).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true

        titleLabel.topAnchor.constraint(equalTo: image.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true

        placeLabel.bottomAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true

        distanceLabel.bottomAnchor.constraint(equalTo: placeLabel.bottomAnchor).isActive = true
        distanceLabel.leadingAnchor.constraint(equalTo: placeLabel.trailingAnchor, constant: 10).isActive = true

        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: distanceLabel.bottomAnchor).isActive = true
    }

    func configure(with model: FavoriteCellModel) {
        self.model = model

        if let imageStringUrl = model.image, let imageUrl = URL(string: imageStringUrl) {
            image.kf.setImage(with: imageUrl)
        } else {
            image.image = UIImage(named: "NoImage")
        }

        titleLabel.text = model.title
        distanceLabel.text = "(\(model.distance))"
        placeLabel.text = model.place
        priceLabel.text = "\(model.price) pln"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        contentView.backgroundColor = .systemBackground
    }
}
