import Foundation

struct InitialDataModel: Codable {
    var result: Bool
    var type: String
    var popularToys: [ToyModel]
    var recentToys: [ToyModel]
    var categories: [CategoryModel]
    var cart: [CartModel]

    enum CodingKeys: String, CodingKey {
        case result
        case type
        case popularToys = "popularToysData"
        case recentToys = "recentToysData"
        case categories
        case cart
    }
}

struct InitialData: Request {
    typealias ReturnType = InitialDataModel
    var queryParams: [String : String]? = [:]
    var path = "initial-data"
    var userId: String

    init(userId: String) {
        self.userId = userId

        queryParams = [
            "userId": userId
        ]
    }
}
