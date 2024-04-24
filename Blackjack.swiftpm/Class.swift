import SwiftUI

struct Card: Identifiable {
    var suit: String
    var value: Int
    var symbol: String
    var imageName: String
    var id: String = UUID().uuidString
    
    init(suit: String, value: Int, symbol: String) {
        self.suit = suit
        self.value = value
        self.symbol = symbol
        self.imageName = "card_\(suit)_\(symbol)"
    }
}
