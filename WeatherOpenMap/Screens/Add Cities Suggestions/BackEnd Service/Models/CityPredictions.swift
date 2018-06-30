//
//  CityPredictions.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct CityPredictions: Mappable {
    
    var predictionDescription:String?
    var terms:[CityPredictionTerm]?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
       self.predictionDescription <- map["description"]
       self.terms <- map["terms"]
    }
    

}
