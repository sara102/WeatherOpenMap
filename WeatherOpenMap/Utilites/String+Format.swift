//
//  String+Format.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/28/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation

extension String
{
  
    
    func toDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func dateFromString(dateString:String)-> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.kGenericWeatherDateFormat
        return dateFormatter.date(from: self) ?? Date()
    }
    
}
