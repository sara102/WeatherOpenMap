//
//  WeatherPerDayDescription.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct WeatherPerDayDescription:Mappable {


    var id:Int?
    var main:String?
    var weatherDescription:String?
    
     init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        main <- map["main"]
        weatherDescription <- map["description"]
    }
    
}
