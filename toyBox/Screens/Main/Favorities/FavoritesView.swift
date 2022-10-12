import UIKit

final class FavoritesView: MainFlatView {

    private let viewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 22)
        label.text = "Favorite Toys"
        label.textColor = UIColor(named: "Accent")
        return label
    }()

    private let emptyView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()

    private let emptyImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "EmptyFavorites")
        return view
    }()

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 18)
        label.text = "You have no favorites yet."
        label.textColor = UIColor(named: "Info")
        return label
    }()

    private let normalView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()

    let favoritesTableView: UITableView = {
        let view = UITableView()
        view.register(FavoriteViewCell.self, forCellReuseIdentifier: FavoriteViewCell.identifier)
        return view
    }()

    let sortOptionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.tintColor = UIColor.darkGray
        return button
    }()

    var isEmpty: Bool = true {
        didSet {
            if isEmpty {
                emptyView.isHidden = false
                normalView.isHidden = true
            } else {
                emptyView.isHidden = true
                normalView.isHidden = false
            }
        }
    }

    override func setupProperties() {
        contentView.addSubviews([emptyView, normalView])

        emptyView.addSubviews([emptyImageView, emptyLabel])
        normalView.addSubviews([favoritesTableView, sortOptionsButton, viewTitleLabel])

        emptyView.constraintToAllEdges(of: contentView)

        normalView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        normalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        normalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        normalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        favoritesTableView.constraintToAllEdges(of: normalView)

        emptyImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -75).isActive = true
        emptyImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true

        emptyLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        emptyLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true

        sortOptionsButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        sortOptionsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        viewTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        viewTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
}
