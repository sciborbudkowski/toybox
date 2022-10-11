import UIKit

class MainFlatView: View {

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    let contentView = UIView()

    let refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = UIColor(named: "Accent")
        control.attributedTitle = NSAttributedString(string: "Pull to refresh",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Accent")!,
                                                                  NSAttributedString.Key.font: UIFont.fontKarla(.regular, ofSize: 16)])
        return control
    }()

    override func setupConstraints() {
        addSubviews([scrollView])
        scrollView.addSubviews([contentView, refreshControl])

        scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        contentView.constraintToAllEdges(of: scrollView)
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
}
