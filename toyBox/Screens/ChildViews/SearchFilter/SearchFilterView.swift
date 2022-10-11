import UIKit

class SearchFilterView: MainStackedView {

    private let titleFilterView = SFTitleFilterView()

    override func setupProperties() {
        insideViews.append(titleFilterView)
    }

    override func setupConstraints() {
        titleFilterView.layer.borderWidth = 2
        titleFilterView.layer.borderColor = UIColor.green.cgColor
    }
}
