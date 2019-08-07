//
//  AuthenticationVC+UserDelegate.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
import SVProgressHUD
extension AuthenticationVC : UsersView , AuthenticationProtocol{

    func changeToLoginSegment() {
        segmentControl.selectedSegmentIndex = 0
        loginView.isHidden = false
        registerView.isHidden = true
    }
    
    // navigate from authentication to locationVC
    func navigateToVC() {
        let vc: UIViewController = storyboard!.instantiateViewController(withIdentifier: "location") as! LocationVC
        self.present(vc, animated: true, completion: nil)
    }
}
