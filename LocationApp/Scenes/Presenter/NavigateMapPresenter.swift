//
//  NavigateMapPresenter.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//


import UIKit
import MapKit
class NavigateMapPresenter {
    //MARK:- property
    private var lat:Double?
    private var longt:Double?
    private let locationManager = CLLocationManager()
    private weak var  view : NavigateMapProtocol!
    private var presenter : NavigateMapPresenter!
    private var mapViewSelectionDelegate: MapViewSelectionDelegate!
    private let annotation = MKPointAnnotation()
    
    //MARK:- init
    init(_view : NavigateMapProtocol , _mapViewSelectionDelegate: MapViewSelectionDelegate) {
        view = _view
        mapViewSelectionDelegate = _mapViewSelectionDelegate
    }
    
    //MARK:- handling
    //mapview region handling
    func setRegion(long :Double ,lat: Double)-> MKCoordinateRegion
    {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        return regionSpan
    }
    
    //update coordinnate values
    func setCoordinate(_lat:Double,_longt:Double){
        lat = _lat
        longt = _longt
    }
    
    //return location
    func getCoordinate () -> (Double,Double) {
        return (longt!,lat!)
    }
    
    // return to LocationVC
    func selectedRegion(){
        mapViewSelectionDelegate.setCoordinates(latInDelegate:lat ?? 0, longtInDelegate: longt ?? 0,isChecked: false)
        view.dismissView()
    }
}
