import Foundation

struct InitialDataModel: Codable {
    var result: Bool
    var type: String
    var popularToys: [ToyModel]
    var recentToys: [ToyModel]
    var categories: [CategoryModel]

    enum CodingKeys: String, CodingKey {
        case result
        case type
        case popularToys = "popularToysData"
        case recentToys = "recentToysData"
        case categories
    }
}

struct InitialData: Request {
    typealias ReturnType = InitialDataModel
    var queryParams: [String : String]? = [:]
    var path = "initial-data"

    init() { }
}
