import Foundation

struct FavoritiesModel: Codable {
    var userId: String
    var toyId: String
}

struct IsFavoritiesModel: Codable {
    var result: Bool
    var type: String
    var data: [FavoritiesModel]
}

struct IsFavorities: Request {
    typealias ReturnType = IsFavoritiesModel
    var queryParams: [String : String]? = [:]
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
    var queryParams: [String : String]? = [:]
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
