//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel1: UILabel!
    
    var numPeople = 2
    var eachOwed = 0.0
    
    var calculator = Calculator()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        calculator.setTip(sender.currentTitle!)
        zeroPercentButton.isSelected = calculator.zeroPercentButton
        tenPercentButton.isSelected = calculator.tenPercentButton
        twentyPercentButton.isSelected = calculator.twentyPercentButton
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValChanged(_ sender: UIStepper) {
        splitNumberLabel1.text = String(format: "%.0f", sender.value)
        numPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = billTextField.text!
        if total != "" {
            eachOwed = calculator.getEachOwed(total, numPeople)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResults") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perPerson = eachOwed
            destinationVC.numPeople = numPeople
            destinationVC.tipPercentage = calculator.tip
        }
    }

}

