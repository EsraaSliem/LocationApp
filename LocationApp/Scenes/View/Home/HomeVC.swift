//
//  HomeVC.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    //MARK:- oulets
    @IBOutlet weak var tableView: UITableView!
    //MARK:- property
    var presenter :HomePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        presenter = HomePresenter(view: self, home: self)
        presenter.viewDidLoad()
    }
}
extension HomeVC : HomeTableViewProtocol,UsersView{
    func refresh() {
        tableView.reloadData()
    }
}
