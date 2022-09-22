import UIKit
import Combine

final class GestureSubscription<S: Subscriber>: Subscription where S.Input == GestureType, S.Failure == Never {

    private var subscriber: S?
    private var gestureType: GestureType
    private var view: UIView

    init(subscriber: S, view: UIView, gestureType: GestureType) {
        self.subscriber = subscriber
        self.view = view
        self.gestureType = gestureType

        configure(gestureType: gestureType)
    }

    private func configure(gestureType: GestureType) {
        let gesture = gestureType.getType()
        gesture.addTarget(self, action: #selector(gestureHandler))
        view.addGestureRecognizer(gesture)
        view.isUserInteractionEnabled = true
    }

    func request(_ demand: Subscribers.Demand) {
    }

    func cancel() {
        subscriber = nil
    }

    @objc private func gestureHandler() {
        _ = subscriber?.receive(gestureType)
    }
}
