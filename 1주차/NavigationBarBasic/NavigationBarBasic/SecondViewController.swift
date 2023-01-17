//
//  SecondViewController.swift
//  NavigationBarBasic
//
//  Created by suhseungju on 2023/01/16.
//

import UIKit

class SecondViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Test2"
    }
}
