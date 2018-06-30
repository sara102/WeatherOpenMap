//
//  CityPredictionTerm.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct CityPredictionTerm: Mappable {

    var value:String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.value <- map["value"]
    }
}
