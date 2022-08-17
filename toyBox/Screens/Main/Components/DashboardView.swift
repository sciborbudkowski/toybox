import UIKit

class DashboardView: View {

    let searchTextField: TextField = {
        let field = TextField()
        field.font = UIFont.FontQuicksand(.regular, ofSize: 15)
        field.attributedPlaceholder = NSAttributedString(string: "Find toy, puzzle and more...",
                                                         attributes: [NSAttributedString.Key.font: UIFont.FontKarla(.regular, ofSize: 16),
                                                                      NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .default
        field.textColor = UIColor(named: "Text")
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 20
        field.padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return field
    }()

    let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.tintColor = UIColor.darkGray
        return button
    }()

    let popularTileView: TileView = {
        let view = TileView()
        view.titleLabel.text = "Popular"
        return view
    }()

    let recentTileView: TileView = {
        let view = TileView()
        view.titleLabel.text = "Recent"
        return view
    }()

    override func setupConstraints() {
        addSubviews([searchTextField, filterButton, popularTileView])

        searchTextField.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: -10).isActive = true

        filterButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        filterButton.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor).isActive = true
        filterButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10).isActive = true
        filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        popularTileView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10).isActive = true
        popularTileView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        popularTileView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        popularTileView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        popularTileView.topAnchor.constraint(equalTo: popularTileView.bottomAnchor, constant: 10).isActive = true
        popularTileView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        popularTileView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        popularTileView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
