//
//  LocationPermissionViewController.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user162257 on 3/6/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit
import SPPermissions

class LocationPermissionViewController: UIViewController {
    @IBOutlet weak var permissionGrantedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        permissionGrantedButton.layer.cornerRadius = 18    }
    
    @IBAction func allowLocationAction(_ sender: Any) {
        let controller = SPPermissions.dialog([.locationWhenInUse])
        controller.titleText = "Get Location Permission"
        controller.present(on: self)
        
        navigateToMain()
        
    }
    
    @IBAction func denyPermission(_ sender: Any) {
        navigateToMain()
    }
    
    func navigateToMain(){
        let mainVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainStoryBoard") as UIViewController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }
    
    

}
