import Foundation

enum ToysType: String, Codable {
    case popular = "popular-toys"
    case recent = "recent-toys"
    case single = "get-toy"
}

struct ToyModel: Codable {
    var id: String
    var name: String
    var description: String
    var dateAdded: String
    var userId: String
    var isActive: Bool
    var isFeatured: Bool
    var viewCount: Int
    var viewCountAsFeatured: Int
    var activeDays: Int
    var images: [String]
    var price: Int
    var categoryId: String
    var subCategoryId: String
    var gender: Int
    var brand: String
    var ageMin: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case description
        case dateAdded
        case userId
        case isActive
        case isFeatured
        case viewCount
        case viewCountAsFeatured
        case activeDays
        case images
        case price
        case categoryId
        case subCategoryId
        case gender
        case brand
        case ageMin
    }
}

struct ToysModel: Codable {
    var result: Bool
    var type: ToysType
    var count: Int
    var data: [ToyModel]
}

struct ToysPopular: Request {
    typealias ReturnType = ToysModel
    var queryParams: [String : String]? = [:]
    var path = "toys-popular"

    init() { }
}

struct ToysRecent: Request {
    typealias ReturnType = ToysModel
    var queryParams: [String : String]? = [:]
    var path = "toys-recent"

    init() { }
}

struct Toy: Request {
    typealias ReturnType = ToysModel
    var queryParams: [String : String]? = [:]
    var path = "get-toy"
    var toyId: String

    init(toyId: String) {
        self.toyId = toyId

        queryParams = [
            "toyId": toyId
        ]
    }
}
