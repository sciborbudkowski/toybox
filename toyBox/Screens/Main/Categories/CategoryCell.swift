import UIKit

class CategoryCell: TableCell {

    var model: CategoryModel? {
        didSet {
            text.text = model?.name
        }
    }

    let background: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5.0
        return view
    }()

    let text: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        return label
    }()

    override func setupLayoutConstraints() {
        contentView.addSubviews([background, text])

        background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -4).isActive = true
        background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -5).isActive = true
        background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true

        text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        text.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 5).isActive = true
        text.sizeToFit()
    }
}
