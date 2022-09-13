import UIKit

class IntroView: View {

    private var hasSkipButton: Bool = true

    let imageView = UIImageView()
    let roundedBackgroundImageView = UIImageView()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 18)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 18)
        return label
    }()

    let skipButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "Skip Intro", attributes: [
                NSAttributedString.Key.font: UIFont.FontKarla(.regular, ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor(named: "Link")!
            ]), for: .normal)
        return button
    }()

    let buttonNext: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Accent")
        return button
    }()

    func configure(with model: IntroModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        hasSkipButton = model.hasSkipButton
    }
}
