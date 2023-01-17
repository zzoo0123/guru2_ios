//
//  SecondViewcontroller.swift
//  ScreenChangeExample
//
//  Created by suhseungju on 2023/01/16.
//

import UIKit

class SecondViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ThirdViewController {
            destination.label_text = "test"
        }
    }
}
