import UIKit

extension UIView {

    func gesture(_ type: GestureType = .tap()) -> GesturePublisher {
        GesturePublisher(view: self, gestureType: type)
    }
}
