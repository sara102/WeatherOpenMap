//
//  CityDTO.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation
class CityDTO: NSObject, NSCoding {
    
    //MARK:decoding keys
    let kCityName = "cityName"
    let kCountryName = "countryName"
    let kWeatherArray = "weatherArray"

    
    //MARK:properties
    var cityName:String?
    var countryName:String?
    var weatherArray:[WeatherForCityDTO] = []
    
    //MARK:NSCoding
    required init(coder decoder: NSCoder) {
        self.cityName = decoder.decodeObject(forKey: kCityName) as? String ?? ""
        self.countryName = decoder.decodeObject(forKey: kCountryName) as? String ?? ""
        self.weatherArray = decoder.decodeObject(forKey: kWeatherArray)  as? [WeatherForCityDTO] ?? []

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(cityName, forKey: kCityName)
        coder.encode(countryName, forKey: kCountryName)
        coder.encode(weatherArray, forKey: kWeatherArray)
    }
    
    
    //MARK: initializers 

    init(cityDescription:String)
    {
        let subString = cityDescription.components(separatedBy: ",")
         self.cityName = subString.first ?? ""
         self.countryName = subString.last ?? ""
        
    }
    
   
    //MARK: processing
    func addWeatherData(weatherApiResponse:WeatherApiResponse)
    {
        weatherArray = []
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
    
    class func cityDTOArrayFromSuggestionBackendList(citySuggestionsAPIResponse:CitySuggestionsAPIResponse)-> [CityDTO]
    {
        var suggestedCitiesUIArray:[CityDTO] = []
        for predication in citySuggestionsAPIResponse.predictions!
        {
            let suggestedCityUIModel = CityDTO(cityDescription: predication.predictionDescription ?? "" )
            suggestedCitiesUIArray.append(suggestedCityUIModel)
        }
        return suggestedCitiesUIArray
    }

    
    //MARK:Utiliy functions
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
