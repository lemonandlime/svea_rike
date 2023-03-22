import Foundation

var str = "Hello, playground"
str
enum Hashy: Hashable, Equatable {
    case blank(Blanky)
    case matte(Matty)

    struct Blanky: Hashable {
        let name: String
    }

    struct Matty: Hashable {
        let name: String
    }
}

let aBlank = Hashy.blank(.init(name: "kalle"))
let aMatte = Hashy.matte(.init(name: "kalle"))

let isEqual = aBlank == aMatte

print(isEqual)
