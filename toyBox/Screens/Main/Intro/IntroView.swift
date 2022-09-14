import UIKit

class IntroView: View {

    private var hasSkipButton: Bool = true

    let imageView = UIImageView()

    let roundedImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "TopLeftRoundedLayer"))
        view.contentMode = .scaleAspectFill
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.semiBold, ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "TextSecondary")
        label.font = UIFont.FontKarla(.ligth, ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
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

    let nextButton: UIButton = {
        var attributedTitle = AttributedString.init("Next Page")
        attributedTitle.font = UIFont.FontKarla(.regular, ofSize: 18)

        var config = UIButton.Configuration.filled()
        config.attributedTitle = attributedTitle
        config.baseBackgroundColor = UIColor(named: "Accent")
        config.cornerStyle = .capsule
        config.image = UIImage(systemName: "arrowshape.right.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 5.0

        let button = UIButton(configuration: config)
        return button
    }()

    let startButton: UIButton = {
        var attributedTitle = AttributedString.init("Let's Start!")
        attributedTitle.font = UIFont.FontKarla(.regular, ofSize: 18)

        var config = UIButton.Configuration.filled()
        config.attributedTitle = attributedTitle
        config.baseBackgroundColor = UIColor(named: "Accent")
        config.cornerStyle = .capsule

        let button = UIButton(configuration: config)
        return button
    }()

    var pageIndicator: PageIndicatorView?

    func configure(with model: IntroModel, itemsCount: Int, currentIndex: Int, color: UIColor = UIColor(named: "Accent")!) {
        imageView.image = model.image
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        hasSkipButton = model.hasSkipButton

        subviews.forEach { subview in
            subview.removeFromSuperview()
        }

        pageIndicator = PageIndicatorView(itemsCount: itemsCount, currentIndex: currentIndex, color: color)

        setupConstraints()
    }

    override func setupConstraints() {
        guard let pageIndicator = pageIndicator else { return }

        addSubviews([imageView, roundedImageView, titleLabel, descriptionLabel, pageIndicator])
        hasSkipButton ? addSubviews([skipButton, nextButton]) : addSubviews([startButton])

        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -250).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

        roundedImageView.topAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 200).isActive = true
        roundedImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        roundedImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        roundedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

        pageIndicator.topAnchor.constraint(equalTo: roundedImageView.topAnchor).isActive = true
        pageIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageIndicator.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pageIndicator.heightAnchor.constraint(equalToConstant: 10).isActive = true

        titleLabel.topAnchor.constraint(equalTo: roundedImageView.topAnchor, constant: 50).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true

        if hasSkipButton {
            nextButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -75).isActive = true
            nextButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).isActive = true

            skipButton.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor).isActive = true
            skipButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        } else {
            startButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -75).isActive = true
            startButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
            startButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).isActive = true
        }
    }
}
