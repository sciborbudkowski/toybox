import UIKit

final class SettingsView: View {

    private let viewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.regular, ofSize: 22)
        label.text = "Settings"
        label.textColor = UIColor(named: "Accent")
        return label
    }()

    let settingsTableView: UITableView = {
        let view = UITableView()
        view.register(SettingsViewCell.self, forCellReuseIdentifier: SettingsViewCell.identifier)
        view.separatorStyle = .none
        return view
    }()

    let signOffButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setAttributedTitle(NSAttributedString(string: "Sign Off", attributes: [
            NSAttributedString.Key.font: UIFont.fontKarla(.medium, ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonInverted")!
        ]), for: .normal)
        button.backgroundColor = UIColor(168, 218, 220)
        button.layer.cornerRadius = 10
        return button
    }()

    override func setupConstraints() {
        addSubviews([viewTitleLabel, settingsTableView, signOffButton])

        viewTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        viewTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        settingsTableView.topAnchor.constraint(equalTo: viewTitleLabel.bottomAnchor, constant: 10).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: signOffButton.topAnchor, constant: -10).isActive = true
        settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        signOffButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        signOffButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signOffButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
