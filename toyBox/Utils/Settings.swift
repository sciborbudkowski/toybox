import Foundation

class Settings {

    static let shared = Settings()

    let userDefaults = UserDefaults.standard

    var isAppFirstRun: Bool {
        var value = userDefaults.value(forKey: "isAppFirstRun") as? Bool

        if let value = value, !value {
            return false
        }

        userDefaults.set(false, forKey: "isAppFirstRun")
        
        return true
    }

    let apiBaseUrl: String = "https://develop-box.pl:8000/"

    let dummyUserId: String = "tYM69m2Lx9agjlWWBtWJQhnpF0q1"
    let dummyToyId: String = "630365927c37bce8c1b8a083"
}
