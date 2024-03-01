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
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billBrain = BillBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if sender.currentTitle == "0%" {
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            zeroPctButton.isSelected = true
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = true
        }  else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        var splitNumber = Int(splitNumberLabel.text ?? "2")
        var totalAmount = Float(billTextField.text ?? "0.0")
        billBrain.calculateTipSelected(amount: totalAmount!, zeroPct: zeroPctButton.isSelected, tenPct: tenPctButton.isSelected, twentyPct: twentyPctButton.isSelected, chosenSplit: splitNumber!)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amount = String(format: "%.2f", billBrain.calculateSplit())
            destinationVC.labelText = billBrain.getMessage()
        }
    }
    
    
}

