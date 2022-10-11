import UIKit
import Kingfisher

class ToyView: View {

    let nameLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.fontKarla(.regular, ofSize: 20)
        label.text = "Some test text here"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let carouselView = CarouselView()

    let mainTableView: UITableView = {
        let view = UITableView()
        view.register(ToyViewCell.self, forCellReuseIdentifier: ToyViewCell.identifier)
        view.allowsSelection = false
        view.separatorStyle = .none
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()

    let addToCartButton: UIButton = {
        var attributedTitle = AttributedString("Add to Cart")
        attributedTitle.font = UIFont.fontKarla(.regular, ofSize: 18)

        var config = UIButton.Configuration.plain()
        config.attributedTitle = attributedTitle
        config.baseForegroundColor = UIColor(named: "Accent")
        config.image = UIImage(systemName: "cart")
        config.imagePlacement = .trailing
        config.imagePadding = 5.0

        let button = UIButton(configuration: config)
        return button
    }()

    let buyNowButton: UIButton = {
        var attributedTitle = AttributedString("Buy Now!")
        attributedTitle.font = UIFont.fontKarla(.regular, ofSize: 18)

        var config = UIButton.Configuration.filled()
        config.attributedTitle = attributedTitle
        config.baseBackgroundColor = UIColor(named: "Accent")
        config.cornerStyle = .capsule

        let button = UIButton(configuration: config)
        return button
    }()

    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.backgroundColor = .systemBackground
        view.spacing = 10
        return view
    }()

    let addToFavoritesButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "Accent")
        return button
    }()

    override func setupConstraints() {
        addSubviews([carouselView, mainTableView, bottomStackView])

        carouselView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        carouselView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        mainTableView.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 10).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor).isActive = true

        bottomStackView.addArrangedSubview(addToCartButton)
        bottomStackView.addArrangedSubview(buyNowButton)
    }
}
