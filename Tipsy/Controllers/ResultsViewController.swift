//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Simon Oh on 10/16/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var perPerson: Double?
    var numPeople: Int?
    var tipPercentage: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", perPerson!)
        settingsLabel.text = "Split between " + String(numPeople!) + " people, with " + String(format: "%.0f", tipPercentage! * 100) + "% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
