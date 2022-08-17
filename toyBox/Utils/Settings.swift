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
            userDefaults.set(false, forKey: "isFirstUse")
            return true
        }

        return value
    }

    let apiBaseUrl: String = "https://develop-box.pl:8000/"
}
