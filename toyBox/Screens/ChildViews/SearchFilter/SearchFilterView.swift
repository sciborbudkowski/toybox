import UIKit

class SearchFilterView: MainStackedView {

    private let titleFilterView = SFTitleFilterView()

    override func setupConstraints() {
        mainView.addArrangedSubview(titleFilterView)

//        titleFilterView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        titleFilterView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        titleFilterView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleFilterView.backgroundColor = .blue
    }
}
