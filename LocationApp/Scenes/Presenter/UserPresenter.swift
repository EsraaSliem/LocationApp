//
//  AuthenticationPresenter.swift
//  LocationApp
//
//  Created by esraa on 8/6/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation

class UserPresenter {
    //MARK:- property
    private weak var view: UsersView?
    private let interactor = UserInteractor()
    private weak var  authDelegate : AuthenticationProtocol!
    
    //MARK:- init
    init(view: UsersView , _authDelegate: AuthenticationProtocol) {
        self.view = view
        authDelegate = _authDelegate
    }
    
    //MARK:- Authentication functionality
    //login
    func logIn(email: String, pass: String) {
        view?.showIndicator()
        interactor.login(email: email, pass: pass) { [weak self]  in
            if let uid = $0
            {
                self?.view?.hideIndicator()
                self?.authDelegate?.navigateToVC()
                
            }
            else {
                print("error")
                self?.view?.showError(error: "invalid email or pass")
            }
            
            
        }
    }
    
    //register
    func register(user :User)
    {
        view?.showIndicator()
        interactor.Register(user: user){
            [weak self] in
            if let error = $0
            {
                self?.view?.showError(error: error as! String)
            }
            else{
                self?.view?.fetchingDataSuccess(message: "registed sucessfuly")
                self?.authDelegate.changeToLoginSegment()
            }
        }
    }
    
    
}
