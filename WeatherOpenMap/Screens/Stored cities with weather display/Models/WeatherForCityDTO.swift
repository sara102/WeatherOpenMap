//
//  WeatherForCityDTO.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation
class WeatherForCityDTO: NSObject, NSCoding {
    
    var dayNumber:Int?
    var minTemp:Double?
    var maxTemp:Double?
    var humidity:Double?
    var weatherDescription:String?

    override init() {
        
    }
    required init(coder decoder: NSCoder) {
        self.dayNumber = decoder.decodeObject(forKey: "dayNumber") as? Int ?? 0
        self.minTemp = decoder.decodeObject(forKey: "minTemp") as? Double ?? 0
        self.maxTemp = decoder.decodeObject(forKey: "maxTemp") as? Double ?? 0
        self.humidity = decoder.decodeObject(forKey: "humidity") as? Double ?? 0
        self.weatherDescription = decoder.decodeObject(forKey: "weatherDescription")  as? String ?? ""
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(dayNumber, forKey: "dayNumber")
        coder.encode(minTemp, forKey: "minTemp")
        coder.encode(maxTemp, forKey: "maxTemp")
        coder.encode(humidity, forKey: "humidity")
        coder.encode(weatherDescription, forKey: "weatherDescription")
    }
    
}
