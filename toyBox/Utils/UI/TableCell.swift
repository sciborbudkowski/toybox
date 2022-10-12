import UIKit

class TableCell: UITableViewCell {

    static let identifier = String(describing: TableCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupProperties()
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupProperties() {
    }

    func setupLayoutConstraints() {
    }
}
