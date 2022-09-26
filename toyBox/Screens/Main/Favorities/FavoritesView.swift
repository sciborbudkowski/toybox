import UIKit

class FavoritesView: MainStackedView {

    private let emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.isHidden = false
        return view
    }()

    private let normalView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.isHidden = true
        return view
    }()

    var isEmpty: Bool = true {
        didSet {
            emptyView.isHidden = !isEmpty
            normalView.isHidden = isEmpty
        }
    }

    override func setupConstraints() {
//        contentView.addSubviews([emptyView, normalView])
//
//        emptyView.topAnchor.constraint(equalTo: insideView.topAnchor).isActive = true
//        emptyView.leadingAnchor.constraint(equalTo: insideView.leadingAnchor).isActive = true
//        emptyView.trailingAnchor.constraint(equalTo: insideView.trailingAnchor).isActive = true
//        emptyView.bottomAnchor.constraint(equalTo: insideView.bottomAnchor).isActive = true
//
//        normalView.topAnchor.constraint(equalTo: insideView.topAnchor).isActive = true
//        normalView.leadingAnchor.constraint(equalTo: insideView.leadingAnchor).isActive = true
//        normalView.trailingAnchor.constraint(equalTo: insideView.trailingAnchor).isActive = true
//        normalView.bottomAnchor.constraint(equalTo: insideView.bottomAnchor).isActive = true
    }
}
