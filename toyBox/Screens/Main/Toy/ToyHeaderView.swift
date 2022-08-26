import UIKit
import CollapseTableView

class ToyHeaderView: UITableViewHeaderFooterView, CollapseSectionHeader {

    static let identifier = String(describing: ToyHeaderView.self)

    lazy var indicatorImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrow.down")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .white
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        return label
    }()
}
