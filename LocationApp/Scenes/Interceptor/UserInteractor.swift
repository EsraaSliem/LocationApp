//
//  FirebaseInterceptor.swift
//  LocationApp
//
//  Created by esraa on 8/6/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
import Firebase
class UserInterceptor{
    func login (email : String,pass: String ,completion: @escaping(String?)->Void  ){
        Auth.auth().signIn(withEmail: email, password: pass)
        {
            (user ,error)
            in
            var uidValue: String?
            if let error = error{
                print(error)
            }
            guard let uid = user?.uid
                else{ return ; }
            uidValue = uid
            completion(uidValue)
            
        }
    }
    func Register(user: User )
    {
        Auth.auth().createUser(withEmail: user.email , password: user.password){
            (users , error)
            in
            if let error = error{
                print(error)
            }
            guard let u = users?.uid
                else{ return ; }
            let userData = [Constants.username : user.username
                ,Constants.lat : user.lat
                ,Constants.lang: user.lang
                ,Constants.email: user.email
                ,Constants.password: user.password] as [String : Any]
            DataService.instance.createFirebaseDBUser(uid: u, userData: userData)
        }
    }
    func fetchUser(completion: @escaping(User?)->Void ){
        let uid = Auth.auth().currentUser!.uid
       DataService.instance.REF_USERS.child(uid).observe(.value, with: {
            (snapshot)
            in
            var value = snapshot.value as? NSDictionary
            if value != nil{
                 //get user value
                let user = User(username: value?[Constants.username] as! String,
                                lang: value?[Constants.lang] as! Double,
                                lat: value?[Constants.lat] as! Double,
                                email: value?[Constants.email] as!String ,
                                password: value?[Constants.password] as! String)
                completion(user)
            }
            else{
                completion(nil)
            }
        })
    }
    
    func updateLocation (lat: Double, lang: Double)
    {   let uid = Auth.auth().currentUser!.uid
        let values = [Constants.lat: lat , Constants.lang: lang]
        DataService.instance.REF_USERS.child(uid).updateChildValues(values)
    }
}
