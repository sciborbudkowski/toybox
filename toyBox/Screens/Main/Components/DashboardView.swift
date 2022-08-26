import UIKit

class DashboardView: MainView {

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

    override func setupProperties() {
        insideViews = [popularTileView, recentTileView, featuredCategoriesTileView]
        insideViews.forEach { $0.isHidden = true }
    }

    override func setupConstraints() {
        super.setupConstraints()
        insideViews.forEach {
            mainView.addArrangedSubview($0)
            $0.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
    }
}
