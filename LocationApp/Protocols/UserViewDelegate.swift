//
//  UserViewDelegate.swift
//  LocationApp
//
//  Created by esraa on 8/6/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
import SVProgressHUD

//Mark : - protocol defination
protocol UsersView: class {
    
    func showIndicator()
    
    func hideIndicator()
    
    func fetchingDataSuccess(message : String)
    
    func showError(error: String)
    
    
}
//Mark : - Default implementation
extension UsersView {
    func showIndicator() {
        SVProgressHUD.show()
    }
    
    func hideIndicator() {
        SVProgressHUD.dismiss()
    }
    
    func fetchingDataSuccess(message : String) {
        SVProgressHUD.showSuccess(withStatus: message)
    }
    
    func showError(error: String) {
        SVProgressHUD.showError(withStatus: error)
    }
}
