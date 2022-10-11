import Foundation

struct UserToToyModel: Codable {
    var userId: String
    var toyId: String

    init(userId: String, toyId: String) {
        self.userId = userId
        self.toyId = toyId
    }
}

struct FavoriteModel: Codable {
    var result: Bool
    var type: String
    var data: [UserToToyModel]
}

struct IsFavorite: Request {
    typealias ReturnType = FavoriteModel
    var queryParams: [String: String]? = [:]
    var path = "is-favorite"
    var userId: String
    var toyId: String

    init(userId: String, toyId: String) {
        self.userId = userId
        self.toyId = toyId

        queryParams = [
            "userId": userId,
            "toyId": toyId
        ]
    }
}

struct FavoriteSwitchModel: Codable {
    var result: Bool
    var type: String
    var operation: String
}

struct SwitchFavorite: Request {
    typealias ReturnType = FavoriteSwitchModel
    var queryParams: [String: String]? = [:]
    var path = "switch-favorite"
    var userId: String
    var toyId: String

    init(userId: String, toyId: String) {
        self.userId = userId
        self.toyId = toyId

        queryParams = [
            "userId": userId,
            "toyId": toyId
        ]
    }
}

struct GetFavorites: Request {
    typealias ReturnType = ToysModel
    var queryParams: [String: String]? = [:]
    var path = "get-favorities"
    var userId: String

    init(userId: String) {
        self.userId = userId

        queryParams = [
            "userId": userId
        ]
    }
}
