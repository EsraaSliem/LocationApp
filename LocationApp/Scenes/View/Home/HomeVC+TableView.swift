//
//  HomeVC+TableView.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import UIKit

extension HomeVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return presenter.getRowCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = presenter.displayTitle(index: indexPath.row)
        cell.detailTextLabel?.text = presenter.displayDetails(index: indexPath.row)
        return cell
    }
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
