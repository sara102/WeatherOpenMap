//
//  WeatherController.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit




//view controller callbacks
protocol WeatherControllerDelegate {

    func populateWeatherList(weatherList:[CityDTO]) -> Void
}


//just an interface so we dont expose all them methods of the controller
protocol WeatherControllerHandler {
    
    // override this variable in viewcontroller
    var weatherControllerDelegate: WeatherControllerDelegate? { get set }
    func fetchFavoriateCitiesWeather()
    func deleteCityFromFavoriateList(city: CityDTO)

}




final class WeatherController {
    
    var weatherControllerDelegate: WeatherControllerDelegate?
    var currentRequest = 0
    var weatherUIModelArray:[CityDTO] = []

    
}

extension WeatherController: WeatherControllerHandler {
    
    
    func deleteCityFromFavoriateList(city: CityDTO) {
        var userCitiesList = WOMLocalStorage.favoriateCitiesList()
        userCitiesList = userCitiesList?.filter {
            return !$0.isEqual(city)
            
        }
        WOMLocalStorage.saveFavoriateCitiesList(citiesList: userCitiesList!)
        self.weatherControllerDelegate?.populateWeatherList(weatherList: userCitiesList!)

    }
    
    
    
    func fetchFavoriateCitiesWeather() {
        
        currentRequest = 0
        weatherUIModelArray = []
        guard self.weatherControllerDelegate != nil else { fatalError(NSLocalizedString("forget_to_attach_delegate_error_string", comment: "attach delegate"))}
        
        let weatherService = WeatherService(delegate: self)
        let citiesList = WOMLocalStorage.favoriateCitiesList()
      
        if let _ = citiesList
        {
            weatherService.executeService(cityDescription: citiesList![currentRequest].cityDescription())
        }
    }
    
   
    
}
extension WeatherController:Connectable
{
    func requestDidSuccess(responseData: Any, service: String) {
        
        switch   service{
        case WeatherService.className:
            if let weatherData = responseData as? WeatherApiResponse {
                
                let newCityToAdd = CityDTO(weatherApiResponse:weatherData)
                var citiesList = WOMLocalStorage.favoriateCitiesList()
                let oldCity = citiesList?[currentRequest]
                newCityToAdd.countryName = oldCity?.countryName
                newCityToAdd.cityName = oldCity?.cityName
                weatherUIModelArray.append(newCityToAdd)

                currentRequest = currentRequest + 1
                
                if(currentRequest < (citiesList?.count)!)
                {
                    let weatherService = WeatherService(delegate: self)
                   
                    weatherService.executeService(cityDescription: citiesList![currentRequest].cityDescription())
                }
                else
                {
                    self.weatherControllerDelegate?.populateWeatherList(weatherList:weatherUIModelArray)
                    WOMLocalStorage.saveFavoriateCitiesList(citiesList: weatherUIModelArray)

                }

                
            }
        default:
            break
        }
        
        
    }
    
    func requestDidFail(error: WAError, errorResponse: Any, service: String) {

        switch   service{
        case WeatherService.className:
            
            var citiesList = WOMLocalStorage.favoriateCitiesList()
            
            let oldCity = citiesList?[currentRequest]
            
            weatherUIModelArray.append(oldCity!)
            currentRequest = currentRequest + 1
            
            if(currentRequest < (citiesList?.count)!)
            {
                let weatherService = WeatherService(delegate: self)
                
                weatherService.executeService(cityDescription: citiesList![currentRequest].cityDescription())
            }
            else
            {
                self.weatherControllerDelegate?.populateWeatherList(weatherList:weatherUIModelArray)
                WOMLocalStorage.saveFavoriateCitiesList(citiesList: weatherUIModelArray)
                
            }
        default:
            break
        }
    }

    
   
}
