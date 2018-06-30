//
//  CitySuggestionsByNameService.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import AlamofireObjectMapper

class CitySuggestionsByNameService: BaseService {

    
    func executeService(city:String) {
        
        var parameters:[String:Any] = [:]
        parameters["input"] = city
        parameters["types"] = Constants.kGooglePlacesSearchType
        parameters["key"] = Constants.kGooglePlacesAPIKey

        super.execute(data:parameters, tag: CitySuggestionsByNameService.className, headers: nil)
    }
    
    override func processReceivedData(responseData: Any, requestId: String)
    {
        
        if let data = responseData as? [String:Any]
        {
            
            if let result =  CitySuggestionsAPIResponse(JSON: data)
            {
                requestDidSuccess(responseData: result, requestId: requestId)
            }
            
        }
        else
        {
            let error = WAError( code: Constants.kInternetIsNotReachableErrorCode, message: NSLocalizedString("internet_is_not_reachable_error_msg", comment: ""))
            requestDidFail(error: error, errorResponse: [:], tag: requestId)
        }
        
    }
    
    
}
