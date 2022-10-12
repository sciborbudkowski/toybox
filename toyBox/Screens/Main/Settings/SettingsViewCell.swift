import UIKit

final class SettingsViewCell: TableCell, SettingsCellContent {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        return label
    }()

    private let icon: UIImageView = {
        let view = UIImageView()
        view.isHidden = true
        view.tintColor = UIColor(named: "Text")
        return view
    }()

    private let switchControl: UISwitch = {
        let control = UISwitch()
        control.tintColor = UIColor(named: "Accent")
        control.isHidden = true
        return control
    }()

    private let linkButton: UIButton = {
        var config = UIButton.Configuration.plain()
        let button = UIButton(configuration: config)
        button.isHidden = true
        return button
    }()

    private let selectedOptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.bold, ofSize: 16)
        label.textColor = UIColor(named: "Text")
        label.isHidden = true
        return label
    }()

    private var controls: [UIView] = []

    override func setupProperties() {
        controls = [titleLabel, icon, switchControl, linkButton, selectedOptionLabel]
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }

    override func setupLayoutConstraints() {
        contentView.addSubviews(controls)
        controls.forEach { $0.isHidden = true }
        titleLabel.isHidden = false
    }

    // swiftlint:disable function_body_length
    func makeContent(for cellType: SettingsCellType) {
        switch cellType {
        case .parent(let label, _):
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            titleLabel.text = label

            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
            icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
            icon.image = UIImage(systemName: "arrowtriangle.forward")
            icon.isHidden = false

        case .switchOption(let label, let state):
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            titleLabel.text = label

            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
            switchControl.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
            switchControl.isHidden = false
            switchControl.isOn = state

        case .externalLink(let label, _):
            linkButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            linkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            linkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            linkButton.setAttributedTitle(NSAttributedString(string: label, attributes: [
                NSAttributedString.Key.font: UIFont.fontKarla(.regular, ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor(named: "Link") as Any
            ]), for: .normal)
            linkButton.isHidden = false

        case .info(let label, let image):
            if let image = image {
                icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
                icon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                icon.widthAnchor.constraint(equalToConstant: 100).isActive = true
                icon.heightAnchor.constraint(equalToConstant: 100).isActive = true
                icon.image = image
                icon.isHidden = false

                titleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10).isActive = true
                titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            } else {
                titleLabel.constraintToAllEdges(of: contentView)
            }

            titleLabel.textAlignment = .center
            titleLabel.text = label
            titleLabel.numberOfLines = 0

        case .selection(let label, let options):
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            titleLabel.text = label

            let selectedOptionText = options.first { $0.state == true }
            selectedOptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            selectedOptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            selectedOptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
            selectedOptionLabel.isHidden = false
            selectedOptionLabel.text = "[\(selectedOptionText?.title ?? "")]"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        contentView.backgroundColor = .systemBackground
    }
}
