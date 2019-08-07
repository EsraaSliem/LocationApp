//
//  DataServices.swift
//  LocationApp
//
//  Created by esraa on 8/6/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
import Firebase
let DB_BASE = Database.database().reference()
class DataService
{
    //MARK: -property
    static let instance = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_USERNAME = DB_BASE.child("username")
    private var _REF_LANG = DB_BASE.child("lang")
    private var _REF_LAT = DB_BASE.child("lat")
    
    //MARK: -handling
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    var REF_USERNAME: DatabaseReference {
        return _REF_USERNAME
    }
    var REF_LANG: DatabaseReference {
        return _REF_LANG
    }
    var REF_LAT: DatabaseReference {
        return _REF_LAT
    }
    // create bew user in realtime firebase
    func createFirebaseDBUser(uid: String , userData: Dictionary<String,Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}

