//
//  ViewController.swift
//  LocationApp
//
//  Created by esraa on 8/6/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import UIKit

class AuthenticationVC: UIViewController {
    
    
    //MARK :- outlets
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //register
    @IBOutlet weak var userNameRegTextField: UITextField!
    @IBOutlet weak var emailRegTextField: UITextField!
    @IBOutlet weak var passRegTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    //login
    @IBOutlet weak var passLoginTextField: UITextField!
    @IBOutlet weak var emailLoginTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK :- property
    var views : [UIView] = []
    var presenter: UserPresenter!
    
    //Mark: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addSegmentsView()
        presenter = UserPresenter(view: self , _authDelegate: self)
    }
    //Mark: - UIHandling
    //view first view
    func addSegmentsView(){
        views.append(loginView)
        views.append(registerView)
        views[1].isHidden = true
    }
    //switching segmentController
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        views[sender.selectedSegmentIndex].isHidden = false
        views[1-sender.selectedSegmentIndex].isHidden = true
    }
    
    
    //Mark: - Actions
    @IBAction func login(_ sender: Any) {
        presenter.logIn(email: emailLoginTextField.text!, pass: passLoginTextField.text!)
    }
    
    @IBAction func register(_ sender: Any) {
        let user = User(username: userNameRegTextField.text!,
                        lang: 0.0, lat: 0.0,
                        email: emailRegTextField.text!,
                        password: passRegTextField.text!)
        presenter.register(user: user)
    }
}
//MARK: -validation
extension AuthenticationVC {
    @IBAction func textFieldEditingChange(_ sender: UITextField) {
        print(sender.text!)
        if !(emailLoginTextField.text?.isEmpty)! && !(passLoginTextField.text?.isEmpty)!
        {
            loginButton.isEnabled = true
            
        }
        else
        {
            loginButton.isEnabled = false
        }
    }
    @IBAction func registerTextFieldEditingChange(_ sender: UITextField) {
        print(sender.text!)
        if !(emailRegTextField.text?.isEmpty)! && !(passRegTextField.text?.isEmpty)! && !(userNameRegTextField.text?.isEmpty)!
        {
            registerButton.isEnabled = true
            
        }
        else
        {
            registerButton.isEnabled = false
        }
    }
}

