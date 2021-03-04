//
//  MKPlacemarkExtensions.swift
//  UberClone
//
//  Created by Manan on 23/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import MapKit

extension MKPlacemark {
    var address: String? {
        get {
            guard let subThoroughfare = subThoroughfare else { return nil }
            guard let thoroughfare = thoroughfare else { return nil }
            guard let locality = locality else { return nil }
            guard let adminArea = administrativeArea else { return nil }
            
            return "\(subThoroughfare) \(thoroughfare), \(locality), \(adminArea)"
        }
    }
}
