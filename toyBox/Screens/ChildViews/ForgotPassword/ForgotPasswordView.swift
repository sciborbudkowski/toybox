import UIKit

final class ForgotPasswordView: View {

    private let logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Logo")
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.medium, ofSize: 20)
        label.text = "Forgot Password?"
        label.textColor = UIColor(named: "Text")
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontKarla(.ligth, ofSize: 15)
        label.text = "Enter email address to send reset password link."
        label.numberOfLines = 2
        label.textColor = UIColor(named: "Text")
        return label
    }()

    let usernameField: UITextField = {
        let field = UITextField()
        field.font = UIFont.fontQuicksand(.regular, ofSize: 15)
        field.placeholder = "Email"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .emailAddress
        field.textColor = UIColor(named: "Text")
        field.borderStyle = .roundedRect
        field.text = "scibor.budkowski@gmail.com"
        return field
    }()

    let remindButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 3.0
        button.backgroundColor = UIColor(named: "Background")
        button.setAttributedTitle(
            NSAttributedString(string: "Send Link",
                               attributes: [
                                NSAttributedString.Key.font: UIFont.fontKarla(.regular, ofSize: 16),
                                NSAttributedString.Key.foregroundColor: UIColor(named: "Button")!
                               ]),
            for: .normal)
        return button
    }()

    let cancelButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            NSAttributedString(string: "Cancel",
                               attributes: [
                                NSAttributedString.Key.font: UIFont.fontKarla(.ligth, ofSize: 15),
                                NSAttributedString.Key.foregroundColor: UIColor(named: "Link")!
                               ]),
            for: .normal)
        return button
    }()

    let activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .medium
        activity.isHidden = true
        return activity
    }()

    override func setupConstraints() {
        addSubviews([logoView, titleLabel, descriptionLabel, usernameField, remindButton, cancelButton, activity])

        logoView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 144).isActive = true

        titleLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        usernameField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30).isActive = true
        usernameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        usernameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        remindButton.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20).isActive = true
        remindButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        remindButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        cancelButton.topAnchor.constraint(equalTo: remindButton.bottomAnchor, constant: 20).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: remindButton.centerXAnchor).isActive = true

        activity.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 20).isActive = true
        activity.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
