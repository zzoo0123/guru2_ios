//
//  ViewController.swift
//  BMICalc
//
//  Created by suhseungju on 2023/01/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bmiField: UITextField!
    
    let numberFormatter:NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal //. deciaml = NumberFormatter.Style.deciaml
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 3
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bmiCalculation(_ sender: Any) {
        if let heightText = heightField.text, let height = Double(heightText), let weightText = weightField.text, let weight = Double(weightText) {
            let bmi = weight / ((height/100)*(height/100))
            bmiField.text = numberFormatter.string(from: NSNumber(value: bmi))
        }
        /*
        weightField.resignFirstResponder()
        heightField.resignFirstResponder()
         */
        // view.resignFirstResponder() -> 동작X
        view.endEditing(true)
    }
    
    // return key -> keyboard 사라짐
    @IBAction func textFieldFinishEdit(_x sender: UITextField) {
        sender.resignFirstResponder()
    }
        
    @IBAction func textEndEditing(_ sender: Any) {
        view.endEditing(true)
    }
}

