import UIKit
import Combine

class LocationUpdater {

    static let shared = LocationUpdater()

    private var locationQueue = DispatchQueue(label: "locationQueue")
    private var cancellables = Set<AnyCancellable>()

    private let locationService = LocationService()

    func startLocationService() {

        let _ = Future<Int, Never> { [weak self] promise in
            self?.locationService.manager.requestWhenInUseAuthorization()
            return promise(.success(1))
        }
            .delay(for: 1.0, scheduler: locationQueue)
            .receive(on: RunLoop.main)
            .sink { _ in }

        locationService.publisher.receive(on: RunLoop.main)
        #if DEBUG
            .sink(receiveCompletion: { error in
                print("Error occured: ", error)
            }, receiveValue: { [weak self] value in
                Storage.shared.locationInfo = value
                self?.locationService.disable()
            }).store(in: &cancellables)
        #else
            .sink(receiveCompletion: { _ in
            }, receiveValue: { [weak self] value in
                Storage.shared.locationInfo = value
                self?.locationService.disable()
            }).store(in: &cancellables)
        #endif

        locationService.enable()
    }
}
