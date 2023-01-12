//
//  ViewController.swift
//  FirebaseBasic
//
//  Created by suhseungju on 2023/01/11.
//

import UIKit
import FirebaseAuthUI
import FirebaseEmailAuthUI
import FirebaseGoogleAuthUI
//import FirebaseFacebookAuthUI

class ViewController: UIViewController, FUIAuthDelegate {
    let authUI = FUIAuth.defaultAuthUI()
    var handle:AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = auth.currentUser {
                // 로그인 된 상태
                if let displayName = currentUser.displayName {
                    let alertController = UIAlertController(title: "Welcome", message:"\(displayName)! welcome", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: false, completion: nil)
                }
            } else {
                // 로그아웃 된 상태
                self.authUI?.delegate = self
                let providers: [FUIAuthProvider] = [
                  FUIEmailAuth(),
                  FUIGoogleAuth() //, FUIFacebookAuth()
                ]
                self.authUI!.providers = providers
                
                let authViewController = self.authUI!.authViewController()
                authViewController.modalPresentationStyle = .fullScreen
                
                self.present(authViewController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    // 로그인이 안되어 있으면 무조건 로그인 창 키기
    // 로그아웃 실행 후 로그인 창 띄우기
    // 한쪽에 앱 켜놓고 -> 다른쪽에 로그인 함
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataReault:AuthDataResult?, error: Error?) {
        print("sign in")
        print(authDataReault)
    }
    
    @IBAction func doSignOut(_ sender: UIButton) {
        /*
        do {
            try authUI?.signOut()
        } catch { // 오류 -> 행동O
            print("로그아웃 에러")
        }
        */
        // let test = try! authUI?.signOut()
        try? authUI?.signOut() // 오류 -> 행동X
    }
}

extension FUIAuthBaseViewController {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = nil
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
    
    }
}
