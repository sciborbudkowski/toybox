import UIKit

class DashboardView: View {

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    private let contentView = UIView()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()

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

    let featuredCategoriesTileView: TileView = {
        let view = TileView()
        view.titleLabel.text = "Featured Categories"
        return view
    }()

    var tileViews: [TileView] = []

    override func setupProperties() {
        tileViews = [popularTileView, recentTileView, featuredCategoriesTileView]
        tileViews.forEach { $0.isHidden = true }
    }

    override func setupConstraints() {
        addSubviews([scrollView, searchTextField, filterButton])
        scrollView.addSubviews([contentView])
        contentView.addSubviews([stackView])

        searchTextField.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        filterButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        filterButton.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor).isActive = true
        filterButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10).isActive = true
        filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        scrollView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        tileViews.forEach {
            stackView.addArrangedSubview($0)
            $0.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
    }
}
