//
//  BillBrain.swift
//  Tipsy
//
//  Created by Krish Patel on 2/17/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {
    
    var bill: Bill?
    
    //
    mutating func calculateTipSelected(amount: Float, zeroPct: Bool, tenPct: Bool, twentyPct: Bool, chosenSplit: Int) {
        
        if tenPct {
            bill = Bill(totalAmount: amount, choosenSplit: chosenSplit, tipSelcted: 0.1)
        } else if twentyPct {
            bill = Bill(totalAmount: amount, choosenSplit: chosenSplit, tipSelcted: 0.2)
        } else {
            bill = Bill(totalAmount: amount, choosenSplit: chosenSplit, tipSelcted: 0.0)
        }
    }
    
    //
    func calculateSplit() -> Float {
        let totAmount = bill?.totalAmount ?? 0.0
        let choSplit = bill?.choosenSplit ?? 0
        let tSelected = bill?.tipSelcted ?? 0.0
        
        let splitAmount = (totAmount + (totAmount * tSelected)) / Float(choSplit)
        return splitAmount
    }

    //
    func getMessage() -> String {
        return "Split between \(bill?.choosenSplit ?? 0) people, with \((bill?.tipSelcted ?? 0.0) * 100)% tip."
    }
    
}
