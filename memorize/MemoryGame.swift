//
//  MemoryGame.swift
//  memorize
//
//  Created by osa on 01.10.2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card> //for read only
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
            !cards[chosenIndex].isFaceUp, //false
           !cards[chosenIndex].isMatched // and false
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil

            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp.toggle()
    }
}
    
    init(numberOfPairs: Int, createContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pair in 0..<numberOfPairs {
            let content: CardContent = createContent(pair)
            cards.append(Card(id: pair*2, content: content))
            cards.append(Card(id: pair*2+1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //CardContent - emoji
    }

}


