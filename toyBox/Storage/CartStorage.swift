import Foundation

class CartStorage {

    static let shared = CartStorage()

    var data: [CartModel] = []
}
