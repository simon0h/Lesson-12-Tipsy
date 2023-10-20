//
//  Calculator.swift
//  Tipsy
//
//  Created by Simon Oh on 10/18/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

struct Calculator {
    
    var tip = 0.1
    var numPeople = 2
    var eachOwed = 0.0
    var zeroPercentButton = false
    var tenPercentButton = true
    var twentyPercentButton = true
    
    mutating func setTip(_ tipString: String) {
        if (tipString == "0%") {
            zeroPercentButton = true
            tenPercentButton = false
            twentyPercentButton = false
            tip = 0.0
        }
        else if (tipString == "10%") {
            zeroPercentButton = false
            tenPercentButton = true
            twentyPercentButton = false
            tip = 0.1
        }
        else {
            zeroPercentButton = false
            tenPercentButton = false
            twentyPercentButton = true
            tip = 0.2
        }
    }
    
    mutating func getEachOwed(_ total: String, _ numPeople: Int) -> Double {
        eachOwed = Double(total)!
        eachOwed = eachOwed * (1 + tip)
        eachOwed = eachOwed / Double(numPeople)
        return eachOwed
    }
    
}
