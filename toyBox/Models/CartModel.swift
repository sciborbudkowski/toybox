import Foundation

struct CartModel: Codable {
    var result: Bool
    var type: String
    var count: Int
    var data: [UserToToyModel]
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
