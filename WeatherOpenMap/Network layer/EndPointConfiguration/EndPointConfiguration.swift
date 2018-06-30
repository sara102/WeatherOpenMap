//
//  EndPointConfiguration.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/28/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation
import Alamofire

class EndPointConfiguration
{
    
    enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
    }


    
    //override if required
    var httpMethod: HTTPMethod { return .post}
    var encoding: ParameterEncoding { return URLEncoding.default }
    var path:String {return ""}
  
    
    var url: String { return ""}

    required init() {
    }
    
    
    


}
