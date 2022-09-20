import UIKit

extension UIScrollView {

    func scrollTo(index: Int, animated: Bool = true) {
        let x = CGFloat(index) * self.frame.width
        // scrollRectToVisible(CGRect(x: x, y: 0, width: x, height: frame.height), animated: animated)
        setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
}
