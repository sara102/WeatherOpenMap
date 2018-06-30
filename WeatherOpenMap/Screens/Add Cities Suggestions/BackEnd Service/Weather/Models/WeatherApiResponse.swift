//
//  WeatherApiResponse.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct  WeatherApiResponse: Mappable{
    

    var weatherCity:WeatherCity?

    var weatherDaysList:[WeatherPerDay]?
    init?(map: Map) {
        
    }
    
     mutating func mapping(map: Map) {
        weatherDaysList <- map["list"]
        weatherCity <- map["city"]

    }
    

}
