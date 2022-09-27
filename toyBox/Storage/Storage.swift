import Foundation

class Storage {

    static let shared = Storage()

    var cart: CartModel = CartModel(result: true, type: "", count: 0, data: [])

    var favorities: FavoriteModel = FavoriteModel(result: true, type: "", data: [])

    var locationInfo: LocationInfo?
}
