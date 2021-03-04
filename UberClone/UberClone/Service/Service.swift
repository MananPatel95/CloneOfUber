//
//  Service.swift
//  UberClone
//
//  Created by Manan on 19/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import Firebase
import CoreLocation
import GeoFire


let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_DRIVER_LOCATIONS = DB_REF.child("driver-locations")


struct Service {
    
    ///let constant in order to share Service
    static let shared = Service()
    
    let driversGeofire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
    
    
    
    
    /**
     Fetches user data for specified uid
     - Parameter uid: User's unique ID in firebase
     - Parameter completion: Closure that returns the user data
     */
    func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            
            completion(user)
        }
    }
    
    
    /**
     Listens for drivers events in the radius
     - Parameter driverEvent: The event to listen for.
     - Parameter location: Location of the rider
     - Parameter completion: Closure that returns drivers in the area
     */
    func listenDriver(for driverEvent: DriverLocationInRadius, location: CLLocation, completion: @escaping(User) -> Void) {
        driversGeofire.query(at: location, withRadius: 50).observe(driverEvent.gfEventType(), with: { (uid, location) in
            self.fetchUserData(uid: uid) { (user) in
                var driver = user
                driver.location = location
                completion(driver)
            }
        })
    }
}
