//
//  ViewController.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user162257 on 3/3/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 20
        registerButton.layer.cornerRadius = 5
    }

    @IBAction func navToRegister(_ sender: Any) {
        let registerVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterStoryBoard") as UIViewController
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func navToForgotPassword(_ sender: Any) {
        let forgotPasswordVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordStoryBoard") as UIViewController
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        self.present(forgotPasswordVC, animated: true, completion: nil)
    }
    
}

