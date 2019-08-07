//
//  LocationPresenter.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import Foundation
import CoreLocation
class LocationPresenter {
    
    //MARK:- property
    private var check:Bool = true
    private var lat:Double?
    private var long :Double?
    private let interacptor = UserInteractor()
    let locationManager = CLLocationManager()
    private weak var view: LocationProtocol!
    
    //MARK:- init
    init(view: LocationProtocol) {
        self.view = view
    }
    
    //MARK:- get currentLocation functionality
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
            if check {
                
                print("Current location: \(currentLocation)")
                let coordinate = manager.location?.coordinate
                self.lat = coordinate?.latitude
                self.long = coordinate?.longitude
                updateFirebaseLocation(long: long! , lat: lat!)
                view.displayLocation(long: long!, lat: lat!)
                
            }
        }
    }
    // 2
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func getCurrentLocation(){
        check = true
        // 1
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        // 1
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            return
        // 2
        case .denied, .restricted:
            view.showDisableAlert()
            return
        case .authorizedAlways, .authorizedWhenInUse:
            
            break
            
        }
        // 4
        
        locationManager.startUpdatingLocation()
    }
    
    //return locationManager
    func getLocationManager() -> CLLocationManager {
        return locationManager
    }
    
    // setCheck know if location current or selected
    func isCheck (_check: Bool)
    {
        check = _check
    }
    
    //Mark:- updateLocation firebase
    func updateFirebaseLocation(long: Double , lat: Double) {
        interacptor.updateLocation(lat: long, lang: lat)
    }
}
