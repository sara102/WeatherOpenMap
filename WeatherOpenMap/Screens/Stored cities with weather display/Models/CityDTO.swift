//
//  CityDTO.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation
class CityDTO: NSObject, NSCoding {
    
    var cityName:String?
    var countryName:String?

    var weatherArray:[WeatherForCityDTO] = []
    
    required init(coder decoder: NSCoder) {
        self.cityName = decoder.decodeObject(forKey: "cityName") as? String ?? ""
        self.countryName = decoder.decodeObject(forKey: "countryName") as? String ?? ""
        self.weatherArray = decoder.decodeObject(forKey: "weatherArray")  as? [WeatherForCityDTO] ?? []

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(cityName, forKey: "cityName")
        coder.encode(countryName, forKey: "countryName")
        coder.encode(weatherArray, forKey: "weatherArray")
    }
    
    init(cityDescription:String)
    {
        let subString = cityDescription.components(separatedBy: ",")
         self.cityName = subString.first ?? ""
         self.countryName = subString.last ?? ""
        
    }
    
   
    init(weatherApiResponse:WeatherApiResponse)
    {
        self.cityName = weatherApiResponse.weatherCity?.name ?? ""
        self.countryName = weatherApiResponse.weatherCity?.country ?? ""
                
        for day in stride(from: 0, to:  weatherApiResponse.weatherDaysList?.count ?? 0, by: 8)
        {
            let weatherFromBackEnd:WeatherPerDay = weatherApiResponse.weatherDaysList![day]
            let weatherForCityDTO = WeatherForCityDTO()
            weatherForCityDTO.maxTemp  = weatherFromBackEnd.main?.tempMax
            weatherForCityDTO.minTemp  = weatherFromBackEnd.main?.tempMin
            weatherForCityDTO.humidity  = weatherFromBackEnd.main?.humidity
            weatherForCityDTO.dayNumber  = Date.numberOfDaysRemainingToDate(endDate: weatherFromBackEnd.date!)
            
            weatherForCityDTO.weatherDescription  = weatherFromBackEnd.weather?.first?.weatherDescription
            self.weatherArray.append(weatherForCityDTO)
        }
    }
    
    func cityDescription() -> String {
        return "\(self.cityName ?? "" ),\(self.countryName ?? "" )"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        
        let secondObject = object as! CityDTO
        if(cityName == secondObject.cityName &&  countryName == secondObject.countryName)
        {
            return true
        }
        return false
    }
   
}
