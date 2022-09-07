import UIKit
import Kingfisher

class ToyView: View {

    let nameLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 20)
        label.text = "Some test text here"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.kf.setImage(with: URL(string: "https://ecsmedia.pl/c/lego-speed-champions-fast-furious-1970-dodge-charger-r-t-76912-w-iext116366406.jpg"))
        return view
    }()

    let mainTableView: UITableView = {
        let view = UITableView()
        view.register(ToyViewCell.self, forCellReuseIdentifier: ToyViewCell.identifier)
        view.allowsSelection = false
        view.separatorStyle = .none
        return view
    }()

    let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(UIColor(named: "Accent"), for: .normal)
        button.titleLabel?.font = UIFont.FontKarla(.ligth, ofSize: 18)
        return button
    }()

    let buyNowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy Now!", for: .normal)
        button.setTitleColor(UIColor(named: "Text"), for: .normal)
        button.backgroundColor = UIColor(named: "Accent")
        button.titleLabel?.font = UIFont.FontKarla(.ligth, ofSize: 18)
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
        addSubviews([imageView, mainTableView, bottomStackView])

        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 175).isActive = true

        bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        mainTableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor).isActive = true

        bottomStackView.addArrangedSubview(addToCartButton)
        bottomStackView.addArrangedSubview(buyNowButton)
    }
}
