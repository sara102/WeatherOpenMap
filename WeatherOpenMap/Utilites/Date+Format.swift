//
//  Date+Format.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation

extension Date {

   

    static func numberOfDaysRemainingToDate(endDate:Date)-> Int
    {
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: endDate)
        return (calendar.dateComponents([.day], from:date1 , to: date2).day) ?? -1
    }
    
}
