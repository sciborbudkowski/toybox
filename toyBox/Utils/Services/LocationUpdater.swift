import UIKit
import Combine
import CoreLocation

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
                Storage.shared.currentLocation = CLLocation(latitude: value.coordinates.latitude, longitude: value.coordinates.longitude)
                self?.locationService.disable()
            }).store(in: &cancellables)
        #endif

        locationService.enable()
    }

    func getDistance(to location: LocationModel) -> String {
        var distance: Double? = nil
        var distanceString = ""

        if let locationInfo = Storage.shared.locationInfo {
            let currentLocation = CLLocation(latitude: locationInfo.coordinates.latitude, longitude: locationInfo.coordinates.longitude)
            let distantLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
            distance = distantLocation.distance(from: currentLocation) / 1000

            if let distance = distance {
                distanceString = "\(String(format: "%.02f km", distance))"

                if distance >= 10 {
                    distanceString = "\(String(format: "%.1f km", distance))"
                }
                if distance >= 100 {
                    distanceString = "\(String(format: "%.0f km", distance))"
                }
            }
        }

        return distanceString
    }
}
