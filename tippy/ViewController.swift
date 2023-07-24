//
//  ViewController.swift
//  tippy
//
//  Created by Heggy Castaneda on 3/13/18.
//  Copyright © 2018 Heggy Castaneda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        // hides keyboard
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Calculate tip according to tip % amount 18%, 20%, 25%
        let tipPercentages = [0.18, 0.2, 0.25]
        
        // assigning billField value (string) into bill variable
        //   Double converts string > number, Swift likes !
        // if value on lef side of ?? is invalid > assign 0 (default)
        //   ex: qwe can't be converted to number
        let bill = Double(billField.text!) ?? 0
        // from tipPercentages array we get the tip%
        //  tipControl.selectedSegmentIndex 0: 18%
        //  tipControl.selectedSegmentIndex 1: 20%
        //  tipControl.selectedSegmentIndex 2: 20%
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Show 2 zeros after decimal point, %.2f > display two decimal
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

