import Foundation

struct CartModel: Codable {
    var id: String
    var userId: String
    var toyId: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userId
        case toyId
    }
}

struct Cart: Request {
    typealias ReturnType = CartModel
    var queryParams: [String : String]? = [:]
    var path = "get-cart"
    var userId: String

    init(userId: String) {
        self.userId = userId

        queryParams = [
            "userId": userId
        ]
    }
}
