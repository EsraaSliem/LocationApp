//
//  HomePresenter.swift
//  LocationApp
//
//  Created by esraa on 8/6/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation

class HomePresenter {
    
    //MARK:- property
    private var user: User?
    private var deatiledArray : [String] = []
    private var interacptor = UserInteractor()
    private weak var view: UsersView!
    private weak var homeDelegate : HomeTableViewProtocol!
    //MARK:- init
    init(view: UsersView, home: HomeTableViewProtocol) {
        self.view = view
        self.homeDelegate = home
    }
    
    func viewDidLoad(){
        view.showIndicator()
        getUser()
    }
    func getUser(){
        interacptor.fetchUser(){ [weak self]
            in
            print("enter to get data")
            if let _user = $0{
                self?.user = _user
                self?.setUpDetailArray(user: _user)
                self?.view.hideIndicator()
                print(""+_user.email)
            }
            else {
                self?.view.showError(error: "can't load")
                print("firebase can't load dat")
            }
        }
    }
    func displayTitle(index: Int)->String
    {
        var returnValue: String!
        switch index {
        case 0:
            returnValue = Title.Token.rawValue
        case 1:
            returnValue = Title.userName.rawValue
        case 2:
            returnValue = Title.password.rawValue
        case 3:
            returnValue = Title.long.rawValue
        case 4:
            returnValue = Title.lat.rawValue
        default:
            returnValue = ""
        }
        return returnValue
    }
    
    func displayDetails(index:Int) -> String
    {
        return deatiledArray[index]
    }
    func setUpDetailArray(user: User)
    {
        deatiledArray.append(interacptor.getUid())
        deatiledArray.append(user.username)
        deatiledArray.append(user.password)
        deatiledArray.append(String(user.lang))
        deatiledArray.append(String(user.lat))
        homeDelegate.refresh()
    }
    func getRowCount() -> Int
    {
        return deatiledArray.count
    }
    
}

