//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import AlamofireObjectMapper

class WeatherService: BaseService {
    
    func executeService(cityDescription:String) {
       
        var parameters:[String:Any] = [:]
            parameters["q"] = cityDescription
            parameters["APPID"] = Constants.kWeatherAPIKey

        super.execute(data:parameters, tag: WeatherService.className, headers: nil)
     }
        
        override func processReceivedData(responseData: Any, requestId: String)
        {
            
            if let data = responseData as? [String:Any]
            {
                if let result =  WeatherApiResponse(JSON: data)
                {
                    requestDidSuccess(responseData: result, requestId: requestId)
                }
            }
            else
            {
                let error = WAError( code: Constants.kInternetIsNotReachableErrorCode, message: NSLocalizedString("error_occured_while_retrive_data", comment: ""))
                requestDidFail(error: error, errorResponse: [:], tag: requestId)
            }
            
        }
    
    
    
    
}
