import UIKit

final class SearchBarView: View {

    let searchTextField: TextField = {
        let field = TextField()
        field.font = UIFont.fontQuicksand(.regular, ofSize: 15)
        field.attributedPlaceholder = NSAttributedString(
            string: "Find toy, puzzle and more...",
            attributes: [
                NSAttributedString.Key.font: UIFont.fontKarla(.regular, ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .default
        field.textColor = UIColor(named: "Text")
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 20
        field.padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return field
    }()

    let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.tintColor = UIColor.darkGray
        return button
    }()

    override func setupConstraints() {
        addSubviews([searchTextField, filterButton])

        searchTextField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        filterButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        filterButton.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor).isActive = true
        filterButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10).isActive = true
        filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
