import SwiftUI

struct ContentView: View {
    
    @State var card: Card = Card(suit: "hearts", value: 10, symbol: "Q")
    @State var deck: Deck = Deck()
    @State var playerCards:[Card] = []
    @State var dealerCards:[Card] = []
    
    @State var gameOver: Bool = false

    
    var playerScore: Int {
        var total = 0 
        for card in playerCards {
            total += card.value
            }
        if playerCards.contains(where: {$0.symbol == "A"}) && total > 21 {
            total -= 10
        }
        return total
    }
    
    var body: some View {
        VStack {
            HStack{
                ForEach(0..<dealerCards.count, id: \.self) { i in 
                    Image((gameOver == false && i == 0) ? "card_back": dealerCards[i].imageName)
                        .resizable()
                        .frame(width: 120, height: 140)
                    
                }
            }
            Button("Deal Card") {
                //                card = deck.dealCard()
                let newCard = deck.dealCard()
                print(newCard.value)
                playerCards.append(newCard)
            }
            Button("Stand") {
                gameOver = true
            }
            Button("New Game") {
                newGame()
                gameOver = false
            }
            HStack(spacing: 2) {
                ForEach(playerCards) {
                    card in Image(card.imageName)
                        .resizable()
                        .frame(width: 120, height: 140)
                }
            }
            Text("\(playerScore)")
                .font(.largeTitle)
            Spacer()
        }
        .padding()
        .font(.largeTitle)
        .onAppear(perform: {
            newGame()
        })
        
    }
    func newGame() {
        dealerCards.removeAll()
        playerCards.removeAll()
        
        playerCards.append(deck.dealCard())
        playerCards.append(deck.dealCard())
        
        dealerCards.append(deck.dealCard())
        dealerCards.append(deck.dealCard())
        
        for card in playerCards {
            print(card.id)
        }
    }
    
}
