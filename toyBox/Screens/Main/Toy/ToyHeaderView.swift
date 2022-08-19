import UIKit
import CollapseTableView

class ToyHeaderView: UITableViewHeaderFooterView, CollapseSectionHeader {

    static let identifier = String(describing: ToyHeaderView.self)

    var indicatorImageView: UIImageView {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrow.down")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .white
        return view
    }
}
