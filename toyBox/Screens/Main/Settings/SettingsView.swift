import UIKit

class SettingsView: View {

    let signOffButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setAttributedTitle(NSAttributedString(string: "Sign Off", attributes: [
            NSAttributedString.Key.font: UIFont.FontKarla(.medium, ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonInverted")!
        ]), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6589999795, green: 0.8550000191, blue: 0.8629999757, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()

    override func setupConstraints() {
        addSubviews([signOffButton])

        signOffButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        signOffButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signOffButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
