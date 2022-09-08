import UIKit

class MainFlatView: View {

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    private let contentView = UIView()

    let searchBarView = SearchBarView()

    var insideView = UIView()

    override func setupConstraints() {
        addSubviews([scrollView, searchBarView])
        scrollView.addSubviews([contentView])
        contentView.addSubviews([insideView])

        searchBarView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        searchBarView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchBarView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        scrollView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        insideView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        insideView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        insideView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        insideView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
