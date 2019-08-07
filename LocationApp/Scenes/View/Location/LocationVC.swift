//
//  LocationVC.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import UIKit
import CoreLocation

class LocationVC: UIViewController, CLLocationManagerDelegate  {
    //MARK:- outlets
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    //MARK:- property
    var presenter: LocationPresenter!
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LocationPresenter(view: self)
        presenter.getLocationManager().delegate = self
    }
    //MARK:- location required functionality
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        presenter.locationManager(manager, didUpdateLocations: locations)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        presenter.locationManager(manager, didFailWithError: error)
    }
    //MARK:-Actions
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        presenter.getCurrentLocation()
    }
 
    @IBAction func selectLocation(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "navigateMap") as! NavigateLocationVC
        vc.mapViewSelectionDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func goHome(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "home") as! HomeVC
        present(vc, animated: true, completion: nil)
    }
}

extension LocationVC: MapViewSelectionDelegate {
    func setCoordinates(latInDelegate:Double , longtInDelegate:Double, isChecked:Bool) {
        presenter.isCheck(_check: isChecked)
        presenter.updateFirebaseLocation(long: longtInDelegate, lat: latInDelegate)
        displayLocation(long: longtInDelegate, lat: latInDelegate)
     
    }
}
