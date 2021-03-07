//
//  LocationPermissionViewController.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user162257 on 3/6/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit
import CoreLocation

class LocationPermissionViewController: UIViewController {
    @IBOutlet weak var permissionGrantedButton: UIButton!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        permissionGrantedButton.layer.cornerRadius = 18    }
    
    @IBAction func allowLocationAction(_ sender: Any) {
        let locStatus = CLLocationManager.authorizationStatus()
           switch locStatus {
              case .notDetermined:
                 locationManager.requestWhenInUseAuthorization()
              return
              case .denied, .restricted:
                 let alert = UIAlertController(title: "Location Services are disabled", message: "Please enable Location Services in your Settings", preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                 alert.addAction(okAction)
                 present(alert, animated: true, completion: nil)
              return
              case .authorizedAlways, .authorizedWhenInUse:
              break
           }
    }
    

}
