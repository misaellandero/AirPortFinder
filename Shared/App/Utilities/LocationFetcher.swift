//
//  LocationFetcher.swift
//  Revisits
//
//  Created by Francisco Misael Landero Ychante on 15/11/20.
//  Copyright © 2020 Francisco Misael Landero Ychante. All rights reserved.
//
import CoreLocation

class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func start() {
        //manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager,
                            didChangeAuthorization status: CLAuthorizationStatus) {
         
        let location = manager.location?.coordinate
        lastKnownLocation = location
    
    }
    
    func locationManager(_ manager: CLLocationManager,
                                didFailWithError error: Error) {
            print( "location manager failed with error \(error)" )
        }
}
