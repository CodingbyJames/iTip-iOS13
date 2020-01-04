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
    
    lazy var buttons = [zeroPctButton, tenPctButton, twentyPctButton]
    var tip = 0.10
    
    

    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        for button in buttons {
            button?.isSelected = false
        }
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPctSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPctSign)!
        
        tip = buttonTitleAsNumber/100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let amount = Double(billTextField.text!)!
            let totalBill = amount * (1 + tip)
            let totalPerPerson = totalBill/Double(splitNumberLabel.text!)!
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amount = String(format: "%.2f", totalPerPerson)
            destinationVC.billDescription = "Split between \(splitNumberLabel.text!) people, with \(Int(tip*100))% tip."
            
            
        }
    }
    
}

