import UIKit

class SwipeableImageViewController: ViewController {

    var images: [UIImage]?
    var currentImage: Int = 0
    var automaticTransition: Bool = true
    var transitionTime: Int = 10

    var customView: SwipeableImageView? = nil

    init(images: [UIImage], currentImage: Int = 0, automaticTransition: Bool = true, transitionTime: Int = 5) {
        self.images = images
        self.currentImage = currentImage
        self.automaticTransition = automaticTransition
        self.transitionTime = transitionTime

        customView = SwipeableImageView(itemsCount: images.count)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }
}
