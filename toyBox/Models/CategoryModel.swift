import Foundation

struct CategoryModel: Codable {
    var id: String
    var name: String
    var parrentId: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case parrentId
    }
}

struct CategoriesModel: Codable {
    var result: Bool
    var count: Int
    var data: [CategoryModel]
}

struct Categories: Request {
    typealias ReturnType = CategoriesModel
    var queryParams: [String: String]? = [:]
    var path = "categories"
    var parrentId: String

    init(parrentId: String = "") {
        self.parrentId = parrentId

        if parrentId != "" {
            queryParams = [
                "parrentId": parrentId
            ]
        }
    }
}
