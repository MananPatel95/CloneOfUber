//
//  LocationHandler.swift
//  UberClone
//
//  Created by Manan on 20/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationHandler()
    var locationManager: CLLocationManager!
    private var location: CLLocation?
    
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
}
