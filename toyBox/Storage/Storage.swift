import Foundation

class Storage {

    static let shared = Storage()

    lazy var cart: CartModel = CartModel(result: true, type: "", count: 0, data: [])
    lazy var favorites: FavoriteModel = FavoriteModel(result: true, type: "", data: [])

    var locationInfo: LocationInfo?
}
