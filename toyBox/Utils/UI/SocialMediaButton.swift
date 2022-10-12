import UIKit

enum SignInProviderType: String {
    case facebook = "Facebook"
    case twitter = "Twitter"
    case apple = "Apple"
    case google = "Google"
}

final class SocialMediaButton: View {

    private let icon = UIImageView()
    private let label = UILabel()

    var type: SignInProviderType? {
        didSet {
            guard let type = type else { return }

            switch type {
            case .facebook:
                icon.image = UIImage(named: "SignInProviderLogos/Facebook")
                icon.tintColor = .white
                label.text = "Continue with Facebook"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = .white
                backgroundColor = UIColor(38, 119, 242)
            case .twitter:
                icon.image = UIImage(named: "SignInProviderLogos/Twitter")
                icon.tintColor = .white
                label.text = "Continue with Twitter"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = .white
                backgroundColor = UIColor(50, 179, 233)
            case .apple:
                icon.image = UIImage(named: "SignInProviderLogos/Apple")
                icon.tintColor = .white
                label.text = "Continue with Apple"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = .white
                backgroundColor = .black
            case .google:
                icon.image = UIImage(named: "SignInProviderLogos/Google")
                label.text = "Continue with Google"
                label.font = UIFont.fontKarla(.regular, ofSize: 18)
                label.textColor = .black
                backgroundColor = .white
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
