import Foundation

enum ToysType: String, Codable {
    case popular = "popular-toys"
    case recent = "recent-toys"
}

struct ToyModel: Codable {
    var id: String
    var name: String
    var description: String
    var dateAdded: String
    var userId: String
    var isActive: Bool
    var viewCount: Int
    var activeDays: Int
    var image: String
    var price: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case description
        case dateAdded
        case userId
        case isActive
        case viewCount
        case activeDays
        case image
        case price
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
