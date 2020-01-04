//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by James Garcia-Bengochea on 1/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var amount: String?
    var billDescription: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = amount
        settingsLabel.text = billDescription
       
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
