//
//  Solid Lab.swift
//  Solid
//
//  Created by Masimo Stephenson on 10/30/25.
//

import Foundation

// Payment Processor
protocol Card {   // Makes sure the card info isn't input wrongly and isn't dumb.
    var bankNumber: Int = { get set }
    var name: String = { get set }
    var securityCode: Int = { get set }
    
    /// ADD METHOD
    
    func purchase()
}

///MAKE DEBIT AND CREDIT CARD WITH DIFFERENT PROPERTIES.

class CreditCard: Card {
    let bankNumber: Int
    let name: String
    let securityCode: Int
    let spendingLimit: Double
    var spent: Double
    var remaining: Double {
        spendingLimit - spent
    }
    
    init(bankNumber: Int,
         name: String,
         securityCode: Int,
         spendingLimit: Double,
         spent: Double,
         balanceDue: Double) {
        self.bankNumber = bankNumber
        self.name = name
        self.securityCode = securityCode
        self.spendingLimit = spendingLimit
        self.spent = spent
    }
    
    func purchase(price: Double) {
        print("Bought something with my credit card.")
    }
}

class DebitCard: Card {
    let bankNumber: Int
    let name: String
    let securityCode: Int
    var amountRemaining: Double
    
    init(bankNumber: Int,
         name: String,
         securityCode: Int,
         amountRemaining: Double) {
        self.bankNumber = bankNumber
        self.name = name
        self.securityCode = securityCode
        self.amountRemaining = amountRemaining
    }
    
    func purchase(price: Double) {
        print("Bought something with my Debit Card")
        amountRemaining -= price
    }
}


let testCard = CardInfo(bankNumber: 12, name: "HI", securityCode: 321)
var debitCard = DebitCard(bankNumber: 12, name: "HI", securityCode: 321, amountRemaining: 50.0)
var creditCard = CreditCard(bankNumber: 15, name: "No", securityCode: 543, spendingLimit: 1000.0, spent: 50.0)

class inputCard {
    enum cardType {
    case debit, credit
    }
    var bankNumbers: [Int:cardType] = []
    
    func storeBankNumbers(card: DebitCard) {
        bankNumbers[card.bankNumber] = cardType.debit
    }
    
    func storeBankNumbers(card: CreditCard) {
        bankNumbers[card.bankNumber] = cardType.credit
    }
    
}

class validateCardInfo {
    /* Get card info and other data from things
    like the inputCard class once it has its properties */
    func validateCardInfo(info: String?) -> Bool {
        //Get info and return whether its valid or not.
    }
}

