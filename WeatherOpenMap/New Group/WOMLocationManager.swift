//
//  WOMLocationManager.swift
//  WeatherOpenMap
//
//  Created by Sara Abdulraheem on 7/1/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation
import CoreLocation

//callbacks
protocol WOMLocationManagerDelegate {
    func updateWithUserCurrentLocation(city:String,country:String)
}

//just an interface so we dont expose all them methods of the controller
protocol WOMLocationManagerHandler {
    
    //callbackDelegate reference
    var locationManagerDelegate: WOMLocationManagerDelegate? { get set }

    func userCurrentLocation()

    
}


class WOMLocationManager : NSObject {
    
    
    //MARK: Singletone
    fileprivate static var locationManager: WOMLocationManager?
    var locationManagerDelegate: WOMLocationManagerDelegate?
    fileprivate  var coreLocationManager:CLLocationManager?

    static func instance()-> WOMLocationManager {
        if locationManager == nil
            {
                locationManager = WOMLocationManager()
            }
            return locationManager!
        }
 
    //MARK: initalizations
    private override init() {
        super.init()
        coreLocationManager = CLLocationManager()
        coreLocationManager?.delegate  = self
    }

    //MARK: helperMethods

    public func userCurrentCityFromCoordinates(latitude:CLLocationDegrees, longitude: CLLocationDegrees,completionHandler:@escaping (_ city:String,_ country:String) -> Void) -> Void
    {
        
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            var city = ""
            var country = ""
            
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            
            // City
            if let _ = placeMark.subAdministrativeArea {
                city = placeMark.subAdministrativeArea!
            }
            
            
            // Country
            if let _ = placeMark.country {
                country = placeMark.country!
            }
            
            completionHandler(city,country)
        })
        
    }
    
}

extension WOMLocationManager:WOMLocationManagerHandler
{
    
    func userCurrentLocation()
    {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                
                coreLocationManager?.requestWhenInUseAuthorization()
                
            case .restricted, .denied:
                
                self.locationManagerDelegate?.updateWithUserCurrentLocation(city: Constants.kUserDefaultCity, country: Constants.kUserDefaultCountry)
                
            case .authorizedAlways, .authorizedWhenInUse:
                coreLocationManager?.startUpdatingLocation()
            }
        }
        else
        {
            self.locationManagerDelegate?.updateWithUserCurrentLocation(city: Constants.kUserDefaultCity, country: Constants.kUserDefaultCountry)
        }
    }
    
}

extension WOMLocationManager : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            coreLocationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            self.locationManagerDelegate?.updateWithUserCurrentLocation(city: Constants.kUserDefaultCity, country: Constants.kUserDefaultCountry)
        case .authorizedAlways, .authorizedWhenInUse:
            coreLocationManager?.startUpdatingLocation()
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        
        let latestLocation = locations.last
        
        
        self.userCurrentCityFromCoordinates(latitude: latestLocation!.coordinate.latitude, longitude: latestLocation!.coordinate.longitude, completionHandler:{
            city,country in
            self.locationManagerDelegate?.updateWithUserCurrentLocation(city: city, country: country)
        } )
        
  
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      
        self.locationManagerDelegate?.updateWithUserCurrentLocation(city: Constants.kUserDefaultCity, country: Constants.kUserDefaultCountry)
    
    }
}
