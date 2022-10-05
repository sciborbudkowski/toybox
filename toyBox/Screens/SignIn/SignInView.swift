import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import AuthenticationServices
import FirebaseCore
import GoogleSignIn
import Combine
import CombineCocoa

class SignInView: View {

    let logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Logo")
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.medium, ofSize: 20)
        label.text = "Login"
        label.textColor = UIColor(named: "Text")
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.ligth, ofSize: 15)
        label.text = "To keep connected with us please login with your personal info."
        label.numberOfLines = 2
        label.textColor = UIColor(named: "Text")
        return label
    }()

    let usernameField: UITextField = {
        let field = UITextField()
        field.font = UIFont.FontQuicksand(.regular, ofSize: 15)
        field.placeholder = "Email"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .emailAddress
        field.borderStyle = .none
        field.textColor = UIColor(named: "Text")
        field.borderStyle = .roundedRect
        return field
    }()

    let passwordField: UITextField = {
        let field = UITextField()
        field.font = UIFont.FontQuicksand(.regular, ofSize: 15)
        field.placeholder = "Password"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.textContentType = .password
        field.isSecureTextEntry = true
        field.borderStyle = .roundedRect
        field.textColor = UIColor(named: "Text")
        return field
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 3.0
        button.backgroundColor = UIColor(named: "Background")
        button.setAttributedTitle(
            NSAttributedString(string: "Login",
                               attributes: [NSAttributedString.Key.font: UIFont.FontKarla(.regular, ofSize: 18),
                                            NSAttributedString.Key.foregroundColor: UIColor(named: "Button")!
                                           ]),
            for: .normal)
        return button
    }()

    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            NSAttributedString(string: "Forgot password?",
                               attributes: [NSAttributedString.Key.font: UIFont.FontKarla(.ligth, ofSize: 15),
                                            NSAttributedString.Key.foregroundColor: UIColor(named: "Link")!
                                           ]),
            for: .normal)
        return button
    }()

    let signupButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            NSAttributedString(string: "Sign up for new account",
                               attributes: [NSAttributedString.Key.font: UIFont.FontKarla(.ligth, ofSize: 15),
                                            NSAttributedString.Key.foregroundColor: UIColor(named: "Link")!
                                           ]),
            for: .normal)
        return button
    }()

    let hLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.cornerRadius = 2.0
        view.clipsToBounds = true
        return view
    }()

    let accentImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Curve")
        return view
    }()

    let accentBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: "Accent")
        return view
    }()

    let smLoginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.ligth, ofSize: 15)
        label.text = "Or login with other providers"
        label.textColor = UIColor(named: "Text")
        return label
    }()

    let fbButton: SocialMediaButton = {
        let button = SocialMediaButton()
        button.type = .facebook
        button.layer.cornerRadius = 3.0
        return button
    }()

    let twitterButton: SocialMediaButton = {
        let button = SocialMediaButton()
        button.type = .twitter
        button.layer.cornerRadius = 3.0
        return button
    }()

    let appleButton: SocialMediaButton = {
        let button = SocialMediaButton()
        button.type = .apple
        button.layer.cornerRadius = 3.0
        return button
    }()

    let googleButton: SocialMediaButton = {
        let button = SocialMediaButton()
        button.type = .google
        button.layer.cornerRadius = 3.0
        return button
    }()

    override func setupConstraints() {
        addSubviews([accentImageView, accentBackgroundView,
                     logoView, titleLabel, descriptionLabel,
                     usernameField, passwordField, loginButton,
                     forgotPasswordButton, signupButton, smLoginLabel,
                     googleButton, appleButton, fbButton, twitterButton])

        logoView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 144).isActive = true

        titleLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        usernameField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30).isActive = true
        usernameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        usernameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 10).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        forgotPasswordButton.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor).isActive = true

        signupButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: forgotPasswordButton.centerXAnchor).isActive = true

        smLoginLabel.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 20).isActive = true
        smLoginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        smLoginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true

        accentImageView.topAnchor.constraint(equalTo: loginButton.bottomAnchor).isActive = true
        accentImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        accentImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        accentImageView.bottomAnchor.constraint(equalTo: fbButton.bottomAnchor).isActive = true

        accentBackgroundView.topAnchor.constraint(equalTo: accentImageView.bottomAnchor).isActive = true
        accentBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        accentBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        accentBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        fbButton.topAnchor.constraint(equalTo: smLoginLabel.bottomAnchor, constant: 20).isActive = true
        fbButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        fbButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        fbButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        twitterButton.topAnchor.constraint(equalTo: fbButton.bottomAnchor, constant: 20).isActive = true
        twitterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        twitterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        appleButton.topAnchor.constraint(equalTo: twitterButton.bottomAnchor, constant: 20).isActive = true
        appleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        appleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        googleButton.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 20).isActive = true
        googleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        googleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
