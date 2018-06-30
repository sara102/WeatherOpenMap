//
//  CitySuggestionsAPIResponse.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct CitySuggestionsAPIResponse:Mappable {

    var predictions:[CityPredictions]?
    
     init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.predictions <- map["predictions"]
    }
    
}
