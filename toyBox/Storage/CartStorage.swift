import Foundation

class CartStorage {

    static let shared = CartStorage()

    var data: CartModel = CartModel(result: true, type: "", count: 0, data: [])
}
