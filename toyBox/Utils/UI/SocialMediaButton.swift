import UIKit

enum SignInProviderType: String {
    case facebook = "Facebook"
    case twitter = "Twitter"
    case apple = "Apple"
    case google = "Google"
}

class SocialMediaButton: View {

    private let icon = UIImageView()
    private let label = UILabel()

    var type: SignInProviderType? {
        didSet {
            guard let type = type else { return }
            switch type {
            case .facebook:
                icon.image = #imageLiteral(resourceName: "Facebook")
                icon.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                label.text = "Continue with Facebook"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.4666666667, blue: 0.9490196078, alpha: 1)
            case .twitter:
                icon.image = #imageLiteral(resourceName: "Twitter.png")
                icon.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                label.text = "Continue with Twitter"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.7019607843, blue: 0.9137254902, alpha: 1)
            case .apple:
                icon.image = #imageLiteral(resourceName: "Apple.png")
                icon.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                label.text = "Continue with Apple"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .google:
                icon.image = #imageLiteral(resourceName: "Google")
                label.text = "Continue with Google"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            layoutIfNeeded()
        }
    }

    override func setupConstraints() {
        addSubviews([icon, label])

        icon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 24).isActive = true

        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
