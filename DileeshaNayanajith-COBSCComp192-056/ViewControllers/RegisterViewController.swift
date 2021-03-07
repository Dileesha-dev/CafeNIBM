//
//  RegisterViewController.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user162257 on 3/6/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeElements()
    }
    
    func customizeElements(){
        errorLabel.alpha = 0
        Utilities.styleFilledButton(registerButton)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(phoneTextField)
        Utilities.styleTextField(passwordTextField)
    }
    
    @IBAction func navToLogin(_ sender: Any) {
        let loginVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginStoryBoard") as UIViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)

    }
    
    @IBAction func registerAction(_ sender: Any) {
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let phone = phoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["phone":phone, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
            let locationVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocationPermissionStoryBoard") as UIViewController
        locationVC.modalPresentationStyle = .fullScreen
            self.present(locationVC, animated: true, completion: nil)
        
    }
    
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }

}
