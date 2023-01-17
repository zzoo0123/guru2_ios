//
//  IntroViewcontroller.swift
//  ScreenChangeExample
//
//  Created by suhseungju on 2023/01/16.
//

import UIKit

class IntroViewcontroller:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NSLog("View appear")
        if let stroyboard = self.storyboard {
            let vc = stroyboard.instantiateViewController(withIdentifier: "firstScreen")
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
