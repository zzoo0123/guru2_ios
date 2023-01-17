//
//  IntroViewController.swift
//  BasicSequence
//
//  Created by suhseungju on 2023/01/18.
//

import UIKit
import SwiftyGif

class IntroViewController:UIViewController {
    
    @IBOutlet weak var intro_image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let gif = try UIImage(gifName: "intro.gif")
            self.intro_image.setGifImage(gif, loopCount: -1)
        } catch {
            NSLog("재생불가")
        }
    }
}
