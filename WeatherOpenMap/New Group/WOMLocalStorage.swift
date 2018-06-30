//
//  WOMLocalStorage.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation

struct WOMLocalStorage {

    //MARK:Keys
   private static let kUserCitiesInLocalStorage = "UserCitiesInLocalStorage"
   private static let kApplicationFirstLaunch = "ApplicationFirstLaunch"

    
    
    //MARK:Methods

    //Methods each object should have 3 methods add,delete,retrive
    public static func saveFavoriateCitiesList(citiesList:[CityDTO])
    {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: citiesList)
        userDefaults.set(encodedData, forKey:kUserCitiesInLocalStorage )
        userDefaults.synchronize()
    }
   
    public static func deleteFavoriateCitiesList()
    {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: kUserCitiesInLocalStorage)
        userDefaults.synchronize()
    }
    
    public static func favoriateCitiesList() -> [CityDTO]?
    {
        let userDefaults = UserDefaults.standard
        var citiesList:[CityDTO]?
        if let decoded =  userDefaults.object(forKey: kUserCitiesInLocalStorage) as? Data ?? nil
        {
            citiesList = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [CityDTO] ?? nil
        }
        return citiesList
    }
    
    
    
    
    public static func saveApplicationFirstLaunch(isApplicationFirstLaunch:Bool)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(isApplicationFirstLaunch, forKey:kApplicationFirstLaunch )
        userDefaults.synchronize()
    }
    
    public static func deleteApplicationFirstLaunch()
    {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: kApplicationFirstLaunch)
        userDefaults.synchronize()
    }
    
    public static func isApplicationFirstLaunch() -> Bool
    {
        let userDefaults = UserDefaults.standard
       return userDefaults.bool(forKey: kApplicationFirstLaunch)
    }
    
}
