//
//  WeatherCity.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct WeatherCity: Mappable {

    var name:String?
    var country:String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        name <- map["name"]
        country <- map["country"]

    }
}
