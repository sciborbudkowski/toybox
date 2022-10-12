import UIKit
import Kingfisher

final class CarouselView: View {

    let contentView = UIView()

    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
        return view
    }()

    let previousButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "TextSecondary")
        button.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "TextSecondary")
        button.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        return view
    }()

    private var indicator: PageIndicatorView?

    func configure(with images: [String]) {
        contentView.addSubviews([stackView])

        images.enumerated().forEach { (_, imageUrlString) in
            let url = URL(string: imageUrlString)
            let imageView = UIImageView()
            imageView.kf.setImage(with: url)
            imageView.clipsToBounds = true
            imageView.contentMode = UIView.ContentMode.scaleAspectFill

            stackView.addArrangedSubview(imageView)
            imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        }

        if images.count > 0 {
            self.indicator = PageIndicatorView(itemsCount: images.count)
            guard let indicator = self.indicator else { return }

            addSubviews([indicator])
            indicator.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            indicator.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
            indicator.widthAnchor.constraint(equalToConstant: 150).isActive = true
            indicator.heightAnchor.constraint(equalToConstant: 10).isActive = true
        }
    }

    func scrollContent(index: Int) {
        scrollView.scrollTo(index: index)
        indicator?.currentIndex = index
    }

    func configure(with emptyImage: UIImage) {
        contentView.addSubviews([stackView])

        let imageView = UIImageView()
        imageView.image = UIImage(named: "NoImage")
        imageView.clipsToBounds = true
        imageView.contentMode = UIView.ContentMode.scaleAspectFill

        stackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    func disableArrows() {
        previousButton.isHidden = true
        nextButton.isHidden = true
    }

    override func setupConstraints() {
        addSubviews([scrollView, previousButton, nextButton])
        scrollView.constraintToAllEdges(of: self)

        scrollView.addSubviews([contentView])
        contentView.constraintToAllEdges(of: scrollView)

        previousButton.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        previousButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        previousButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        nextButton.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
