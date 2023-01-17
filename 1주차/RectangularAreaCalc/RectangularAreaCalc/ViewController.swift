//
//  ViewController.swift
//  RectangularAreaCalc
//
//  Created by suhseungju on 2023/01/17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var widthField: UITextField!
    @IBOutlet weak var areaField: UITextField!
    
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
    
    @IBAction func doCalc(_ sender: UIButton) {
        if let widthField = widthField.text, let width = Double(widthField), let heightField = heightField.text, let height = Double(heightField) {
            let area = width * height
            areaField.text = numberFormatter.string(from: NSNumber(value: area))
           }
    }
    
}

