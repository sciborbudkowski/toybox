import Foundation

class Settings {

    static let shared = Settings()

    let userDefaults: UserDefaults

    private init() {
        userDefaults = UserDefaults.standard
    }

    var isAppFirstRun: Bool {
        let value: Bool? = userDefaults.value(forKey: "isAppFirstRun") as? Bool

        guard let value = value else {
            userDefaults.set(true, forKey: "isFirstUse")
            return true
        }

        return value
    }

    //var isBackFromChildController: Bool = false

    let apiBaseUrl: String = "https://develop-box.pl:8000/"

    let dummyUserId: String = "tYM69m2Lx9agjlWWBtWJQhnpF0q1"
    let dummyToyId: String = "630365927c37bce8c1b8a083"
}
