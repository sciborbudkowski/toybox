import UIKit

final class ToyHeaderView: UITableViewHeaderFooterView {

    static let identifier = String(describing: ToyHeaderView.self)

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.medium, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        contentView.addSubviews([titleLabel])

        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
