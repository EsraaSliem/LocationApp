//
//  NavigateLocationVC.swift
//  LocationApp
//
//  Created by esraa on 8/7/19.
//  Copyright © 2019 esraa. All rights reserved.
//

import UIKit
import MapKit
class NavigateLocationVC: UIViewController {
    //MARK:- outlets
    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var DoneButton: UIButton!
    
    //MARK:- property
    var mapViewSelectionDelegate: MapViewSelectionDelegate!
    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    var presenter : NavigateMapPresenter!
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = NavigateMapPresenter(_view: self , _mapViewSelectionDelegate : mapViewSelectionDelegate)
        //initial location to view region
        setCoordinates(long: Constants.longViewRegion, lat: Constants.latViewRegion)
    }
    
    //MARK:- setUp MapKit functionality
    func setCoordinates(long:Double , lat:Double) {
        let regionSpan = presenter.setRegion(long: long, lat: lat)
        mapKit.setRegion(regionSpan, animated:true)
        mapKit.isZoomEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        mapKit.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handleTap(_ gestureReconizer: UILongPressGestureRecognizer) {
        let location = gestureReconizer.location(in: mapKit)
        let coordinate = mapKit.convert(location,toCoordinateFrom: mapKit)
        
        // Add annotation:
        annotation.coordinate = coordinate
        mapKit.addAnnotation(annotation)
        presenter.setCoordinate(_lat: coordinate.latitude, _longt: coordinate.longitude)
    }
    
    @IBAction func selectLocation(_ sender: UIButton) {
       presenter.selectedRegion()
    }
}



//MARK:- NavigateMapProtocol
// to return to LocationVC
extension NavigateLocationVC : NavigateMapProtocol{
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
