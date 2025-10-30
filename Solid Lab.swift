//
//  Solid Lab.swift
//  Solid
//
//  Created by Masimo Stephenson on 10/30/25.
//

import Foundation

// Payment Processor
protocol Card {   // Makes sure the card info isn't input wrongly and isn't dumb.
    var bankNumber: Int = { get }
    var name: String = { get }
    var securityCode: Int = { get }
}

class CardInfo: Card {
    let bankNumber: Int
    let name: String
    let securityCode: Int
    
    init(bankNumber: Int,
         name: String,
         securityCode: Int) {
        self.bankNumber = bankNumber
        self.name = name
        self.securityCode = securityCode
    }
}

let testCard = CardInfo(bankNumber: 12, name: "HI", securityCode: 321)

class inputCard {
    
    func takeCardInfo(cardInfo: CardInfo) {
        //Take the card info
    }
}

class validateCardInfo {
    /* Get card info and other data from things
    like the inputCard class once it has its properties */
    func validateCardInfo(info: String?) -> Bool {
        //Get info and return whether its valid or not.
    }
}

