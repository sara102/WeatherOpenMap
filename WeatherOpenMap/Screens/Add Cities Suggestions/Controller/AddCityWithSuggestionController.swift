//
//  AddCityWithSuggestionController.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation

//view controller callbacks
protocol AddCityWithSuggestionDelegate {
    func updateUIWithCitiesList(suggestions:[CityDTO]) -> Void
    func notifyForCityAddeddSuccessfully()
    func notifyForCitiesExceededSpecifiedLimit()

}

//just an interface so we dont expose all them methods of the controller
protocol AddCityWithSuggestionHandler {
    
    var addCityWithSuggestionDelegate: AddCityWithSuggestionDelegate? { get set }
    func citySuggestionsByName(city:String)
    func saveCityInFavoriateList(city:CityDTO)

}



final class AddCityWithSuggestionController {
    
    var addCityWithSuggestionDelegate: AddCityWithSuggestionDelegate?
    
    func suggestionUIArrayModelFromBackendResponse(citySuggestionsAPIResponse:CitySuggestionsAPIResponse) -> [CityDTO] {
        
        var suggestedCitiesUIArray:[CityDTO] = []
        for predication in citySuggestionsAPIResponse.predictions!
        {
            let suggestedCityUIModel = CityDTO(cityDescription: predication.predictionDescription ?? "" )
            suggestedCitiesUIArray.append(suggestedCityUIModel)
        }
        return suggestedCitiesUIArray
    }
    
 
}


extension AddCityWithSuggestionController:AddCityWithSuggestionHandler {
   
   

    func saveCityInFavoriateList(city:CityDTO)
    {
        var userCitiesList = WOMLocalStorage.favoriateCitiesList()
        if (userCitiesList == nil)
        {
            userCitiesList = []
        }
        else if (userCitiesList?.count == 5)
        {
            addCityWithSuggestionDelegate?.notifyForCitiesExceededSpecifiedLimit()
            return
        }
        
        userCitiesList?.append(city)
        WOMLocalStorage.saveFavoriateCitiesList(citiesList: userCitiesList!)
        addCityWithSuggestionDelegate?.notifyForCityAddeddSuccessfully()

    }
    
    
    func citySuggestionsByName(city:String){
        
        guard self.addCityWithSuggestionDelegate != nil else { fatalError(NSLocalizedString("forget_to_attach_delegate_error_string", comment: "attach delegate"))}
        
        let citySuggestionsService = CitySuggestionsByNameService(delegate: self)
        citySuggestionsService.executeService(city:city)
    }
    
    
 
}


extension AddCityWithSuggestionController:Connectable {
    func requestDidSuccess(responseData: Any, service: String) {
        
        switch service{
            
        case CitySuggestionsByNameService.className:
            
            if let suggestionsList = responseData as? CitySuggestionsAPIResponse {
                
                let suggestionsUIList = self.suggestionUIArrayModelFromBackendResponse(citySuggestionsAPIResponse: suggestionsList)
                if let userCitiesList = WOMLocalStorage.favoriateCitiesList()
                {
                    let modifiedSuggestionsUIList = suggestionsUIList.filter {
                        return !userCitiesList.contains($0)
                    }
                    addCityWithSuggestionDelegate?.updateUIWithCitiesList(suggestions: modifiedSuggestionsUIList)

                }
                else
                {
                    addCityWithSuggestionDelegate?.updateUIWithCitiesList(suggestions: suggestionsUIList)
                }
            }
            
        default:
            fatalError("Not yet implemented")
            break
        }
        
        
    }
    
    func requestDidFail(error: WAError, errorResponse: Any, service: String) {
        
    }
    
    
    
}

