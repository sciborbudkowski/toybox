import UIKit

class BoxView: View {

    let logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Logo")
        return view
    }()

    let signOffButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setAttributedTitle(NSAttributedString(string: "Sign Off", attributes: [
            NSAttributedString.Key.font: UIFont.FontKarla(.regular, ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonInverted")!
        ]), for: .normal)

        button.setImage(UIImage(named: "SignOut"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    override func setupConstraints() {
        addSubviews([logoView, signOffButton])

        logoView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 144).isActive = true

        signOffButton.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        signOffButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        signOffButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
