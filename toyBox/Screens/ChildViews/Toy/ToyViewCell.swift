import UIKit

struct ToyPropertyType {
    var name: String
    var value: String
}

class ToyViewCell: TableCell {

    var model: ToyPropertyType? {
        didSet {
            rightLabel.text = model?.name
            leftLabel.text = model?.value
        }
    }

    let rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        label.textAlignment = .left
        return label
    }()

    let leftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.bold, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        label.textAlignment = .right
        return label
    }()

    override func setupLayoutConstraints() {
        contentView.addSubviews([leftLabel, rightLabel])

        rightLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        rightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
        rightLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true

        leftLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        leftLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10).isActive = true
        leftLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }

    func setBackgroundColor(forRow value: Int) {
        contentView.backgroundColor = .white
        if value % 2 == 0 {
            contentView.backgroundColor = .systemGray5
        }
    }
}
