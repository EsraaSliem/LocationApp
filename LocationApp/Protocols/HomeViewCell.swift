//
//  HomeViewCell.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
protocol HomeCellView {
    func displayName(name: String)
    func displayEmail(email: String)
    func displayAddress(address: String)
}
