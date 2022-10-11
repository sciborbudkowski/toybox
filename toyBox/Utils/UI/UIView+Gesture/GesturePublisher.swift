import UIKit
import Combine
import CombineCocoa

enum GestureType {
    case tap(UITapGestureRecognizer = .init())
    case longPress(UILongPressGestureRecognizer = .init())
    case pan(UIPanGestureRecognizer = .init())
    case pinch(UIPinchGestureRecognizer = .init())
    case swipeLeft(UISwipeGestureRecognizer = .init())
    case swipeRight(UISwipeGestureRecognizer = .init())
    case edge(UIScreenEdgePanGestureRecognizer = .init())

    func getType() -> UIGestureRecognizer {
        switch self {
        case let .tap(tapGesture):
            return tapGesture
        case let .longPress(longPressGesture):
            return longPressGesture
        case let .pan(panGesture):
            return panGesture
        case let .pinch(pinchGesture):
            return pinchGesture
        case let .swipeLeft(swipeGesture):
            swipeGesture.direction = .left
            return swipeGesture
        case let .swipeRight(swipeGesture):
            swipeGesture.direction = .right
            return swipeGesture
        case let .edge(edgeGesture):
            return edgeGesture
        }
    }
}

struct GesturePublisher: Publisher {

    typealias Output = GestureType
    typealias Failure = Never

    private let view: UIView
    private let gestureType: GestureType

    init(view: UIView, gestureType: GestureType) {
        self.view = view
        self.gestureType = gestureType
    }

    func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, GestureType == S.Input {
        let subscription = GestureSubscription(subscriber: subscriber,
                                               view: view,
                                               gestureType: gestureType)
        subscriber.receive(subscription: subscription)
    }
}
