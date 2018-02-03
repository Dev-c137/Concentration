//
//  Concentration.swift
//  Concentration
//
//  Created by Devang Pawar on 02/12/17.
//  Copyright © 2017 Thakur's. All rights reserved.
//

import Foundation

struct Concentration{
    private(set) var cards = [Card]()  
    
    var flipCount = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    var matchCount = 0
    
    mutating func chooseCard(at index :Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at:\(index)): chosen index not in cards")
        flipCount += 1
        if !cards[index].isMatched{
            if cards[index].isFlipedBefore{
                matchCount -= 1
            }
            // if chosen card is not matched yet
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard , matchedIndex != index{
                if cards[matchedIndex] == cards[index]{
                    // maching
                    matchCount += 2
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                // not matching card is picked
                cards[index].isFlipedBefore = true
                cards[index].isFaceUp = true
                
            } else {
                cards[index].isFlipedBefore = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards : Int){
        assert(numberOfPairOfCards > 0,"Concentration.init(\(numberOfPairOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card,card]
        }
        // shuffle the cards
        for curruntCard in 0..<cards.count{
            let randomCard = Int(arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(curruntCard, randomCard)
        }
    }
    
}


extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
