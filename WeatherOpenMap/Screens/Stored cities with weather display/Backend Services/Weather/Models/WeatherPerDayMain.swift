//
//  WeatherPerDayMain.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct WeatherPerDayMain: Mappable {
  
    var tempMin:Double?
    var tempMax:Double?
    var humidity:Double?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
      
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
        humidity <- map["humidity"]
    }

}
