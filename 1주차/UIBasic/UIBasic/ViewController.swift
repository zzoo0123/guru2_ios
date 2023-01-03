//
//  ViewController.swift
//  UIBasic
//
//  Created by suhseungju on 2022/12/31.
//

import UIKit

class ViewController: UIViewController {
    /*
     UI 요소 연결 방식
     1. IBOutlet: UI 요소를 변수와 연결하는 것
     2. IBAction: UI 요소의 이벤트를 연결하는 것
     */
    
    @IBOutlet weak var label1: UITextField!
    @IBOutlet weak var label2: UITextField!
    
    let numberFormatter:NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("앱 화면이 나타납니다.")
    }
 
    @IBAction func doConvert(_ sender: UIButton) {
        // 포장 벗김
        if let value1 = label1.text, let number1 = Double(value1) {
            // 섭씨 * 1.8 + 32 = 화씨
            let fahrenheit = number1 * 1.8 + 32
            label2.text = numberFormatter.string(from: NSNumber(value: fahrenheit))
            label1.resignFirstResponder() // keboard 생략
        }
        print("버튼이 눌렸습니다.")
    }
    
    // view 아무곳 터치 -> keyborad 사라짐
    @IBAction func dismissKeyboard(_ sender: Any) {
        label1.resignFirstResponder()
        label1.resignFirstResponder()
    }
    
}

