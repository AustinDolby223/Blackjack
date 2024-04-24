import SwiftUI

class Deck: ObservableObject {
    
    @Published var cards: [Card] = []
    
    init() {
        loadCards()
        shuffle()
    }
    func loadCards() {
        cards.removeAll()
        let suits: [String] = ["hearts", "clubs", "diamonds", "spades"]
        
        let symbols: [String] = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "J", "Q", "K", "A"]
        
        for suit in suits {
            for symbol in symbols {
                var value = 10
                if symbol == "J" || symbol == "Q" || symbol == "K" {
                    value = 10
                } else if symbol == "A" {
                    value = 11
                } else {
                    value = Int(symbol) ?? 0
                }
                let newCard = Card(suit: suit, value: 10, symbol: symbol) 
                cards.append(newCard)
                                   
            }
        }
    }
    
    func shuffle() {
                    cards.shuffle()
                }
    func dealCard() -> Card {
        if cards.count > 0 {
            return cards.removeLast()
        }
        else {
            print("Out of Cards!!")
            loadCards()
            shuffle()
            return dealCard()
        }
    }
}
