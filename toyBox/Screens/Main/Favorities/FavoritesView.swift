import UIKit

class FavoritesView: MainFlatView {

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
        label.font = UIFont.FontKarla(.regular, ofSize: 18)
        label.text = "You have no favorities yet."
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
        view.separatorStyle = .none
        view.allowsSelection = false
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
        normalView.addSubviews([favoritesTableView, sortOptionsButton])

        emptyView.constraintToAllEdges(of: contentView)
        normalView.constraintToAllEdges(of: contentView)
        favoritesTableView.constraintToAllEdges(of: normalView)

        emptyImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -75).isActive = true
        emptyImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true

        emptyLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        emptyLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true


    }
}
