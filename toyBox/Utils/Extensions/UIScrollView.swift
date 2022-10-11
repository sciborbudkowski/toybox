import UIKit

extension UIScrollView {

    func scrollTo(index: Int, animated: Bool = true) {
        let xPoint = CGFloat(index) * self.frame.width
        setContentOffset(CGPoint(x: xPoint, y: 0), animated: true)
    }
}
