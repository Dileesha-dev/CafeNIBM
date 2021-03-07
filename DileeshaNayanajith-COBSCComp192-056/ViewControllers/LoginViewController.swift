//
//  ViewController.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user162257 on 3/3/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeElements()
    }
    
    func customizeElements(){
        errorLabel.alpha = 0
        Utilities.styleFilledButton(signInButton)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
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
    
    @IBAction func signInAction(_ sender: Any) {
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                let locationVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocationPermissionStoryBoard") as UIViewController
            locationVC.modalPresentationStyle = .fullScreen
                self.present(locationVC, animated: true, completion: nil)
            }
        }
    }
    }
    

