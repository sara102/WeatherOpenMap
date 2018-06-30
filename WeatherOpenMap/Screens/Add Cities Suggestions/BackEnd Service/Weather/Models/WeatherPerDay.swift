//
//  WeatherPerDay.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import ObjectMapper

struct WeatherPerDay: Mappable {


    var main:WeatherPerDayMain?
    var weather:[WeatherPerDayDescription]?
    var date:Date?
    fileprivate var dateAsString:String?

    init?(map: Map) {
        
    }
    
     mutating func mapping(map: Map) {
        
        main <- map["main"]
        weather <- map["weather"]
        dateAsString <- map["dt_txt"]
        date = dateAsString?.dateFromString(dateString:dateAsString ?? "" )
       
    }
    
    
}
