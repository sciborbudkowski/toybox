import UIKit

final class MainStackedView: View {

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    private let contentView = UIView()

    let searchBarView = SearchBarView()

    let mainView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()

    let refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = UIColor(named: "Accent")
        control.attributedTitle = NSAttributedString(string: "Pull to refresh",
                                                     attributes: [
                                                        NSAttributedString.Key.foregroundColor: UIColor(named: "Accent")!,
                                                        NSAttributedString.Key.font: UIFont.fontKarla(.regular, ofSize: 16)
                                                     ])
        return control
    }()

    var insideViews: [UIView] = [] {
        didSet {
            insideViews.forEach {
                mainView.addArrangedSubview($0)
            }
        }
    }

    override func setupConstraints() {
        addSubviews([scrollView, searchBarView])
        scrollView.addSubviews([contentView, refreshControl])
        contentView.addSubviews([mainView])

        searchBarView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        searchBarView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchBarView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        scrollView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        mainView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
