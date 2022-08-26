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
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        label.textAlignment = .left
        return label
    }()

    let leftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.textColor = .black //UIColor(named: "Text")
        label.textAlignment = .right
        return label
    }()

    override func setupLayoutConstraints() {
        contentView.addSubviews([rightLabel, leftLabel])

        rightLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        rightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        rightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        rightLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true

        leftLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        leftLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        leftLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: -0.5).isActive = true
    }
}
