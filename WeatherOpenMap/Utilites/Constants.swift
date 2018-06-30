//
//  Constants.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

struct Constants {
    
    //Notification
    public static let kInternetIsReachable = "Reachable"
    public static let kInternetIsNotReachable = "NotReachable"
    
    
    public static let kEndPointClassSuffix = "Configuration"
    public static let kBundleName = "CFBundleExecutable"
    
    
    
    
    //Errors
    public static let kInternetIsNotReachableErrorCode = -1
    
    // keys
    public static let kWeatherAPIKey = "5cba70a317a07584c93bc091c82775c4"
    public static let kGooglePlacesAPIKey = "AIzaSyCCW01AeTL84m461R2KzWDYmeEIXjC1HJI"

    
    // Formatting
    public static let kGenericWeatherDateFormat = "yyyy-MM-dd HH:mm:ss"

    // URLS
    public static let kWeatherBaseURL = "https://api.openweathermap.org/data/2.5/forecast"
    public static let kGooglePlacesURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json"

    
    public static let kGooglePlacesSearchType = "(cities)"

    
    public static let kCurrentUserLocal = "en_US"
    
}
