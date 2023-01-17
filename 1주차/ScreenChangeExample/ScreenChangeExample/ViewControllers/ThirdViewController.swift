//
//  ThirdViewController.swift
//  ScreenChangeExample
//
//  Created by suhseungju on 2023/01/16.
//

import UIKit

class ThirdViewController:UIViewController {
    @IBOutlet weak var label: UILabel!
    var label_text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("Third View Init")
    }
  
    override func viewWillAppear(_ animated: Bool) {
        self.label.text = self.label_text
    }
    // 화면이 완전히 보여주는 것이 끝난 뒤
    /*
    override func viewDidAppear(_ animated: Bool) {
        self.label.text = self.label_text
    }
     */
    
    // Third screen - back button -> second screen
    @IBAction func goBack(_ sender: Any) {
        if let preVC = self.presentingViewController as? UIViewController {
            preVC.dismiss(animated: false, completion: nil)
        }
    }
}
