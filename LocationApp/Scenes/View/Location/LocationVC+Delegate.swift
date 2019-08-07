//
//  LocationVC+Delegate.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import UIKit
extension LocationVC : LocationProtocol
{
    func displayLocation(long: Double, lat: Double) {
        longitudeLabel.text = String(long)
        latitudeLabel.text = String(lat)
    }
    
    func showDisableAlert() {
        let alert = UIAlertController(title: "Location Services disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
   
}

