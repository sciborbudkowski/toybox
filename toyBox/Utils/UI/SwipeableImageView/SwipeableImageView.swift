import UIKit

class SwipeableImageView {

    var images: [UIImage]?
    var currentImage: Int?
    var automaticTransition: Bool = true
    var transitionTime: Int = 10

    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private let dotImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
}
