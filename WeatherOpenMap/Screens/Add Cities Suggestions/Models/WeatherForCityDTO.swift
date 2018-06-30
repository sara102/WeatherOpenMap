//
//  WeatherForCityDTO.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation
class WeatherForCityDTO: NSObject, NSCoding {
    
    //MARK:decoding keys
    let kDayNumber = "dayNumber"
    let kMinTemp = "minTemp"
    let kMaxTemp = "maxTemp"
    let kHumidity = "humidity"
    let kWeatherDescription = "weatherDescription"

    //MARK:properties
    var dayNumber:Int?
    var minTemp:Double?
    var maxTemp:Double?
    var humidity:Double?
    var weatherDescription:String?

    
    //MARK: initializers
    override init() {
        super.init()
    }
    
    //MARK:NSCoding
    required init(coder decoder: NSCoder) {
        self.dayNumber = decoder.decodeObject(forKey: kDayNumber) as? Int ?? 0
        self.minTemp = decoder.decodeObject(forKey:kMinTemp ) as? Double ?? 0
        self.maxTemp = decoder.decodeObject(forKey: kMaxTemp) as? Double ?? 0
        self.humidity = decoder.decodeObject(forKey: kHumidity) as? Double ?? 0
        self.weatherDescription = decoder.decodeObject(forKey: kWeatherDescription)  as? String ?? ""
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(dayNumber, forKey: kDayNumber)
        coder.encode(minTemp, forKey: kMinTemp)
        coder.encode(maxTemp, forKey: kMaxTemp)
        coder.encode(humidity, forKey: kHumidity)
        coder.encode(weatherDescription, forKey: kWeatherDescription)
    }
    
}
