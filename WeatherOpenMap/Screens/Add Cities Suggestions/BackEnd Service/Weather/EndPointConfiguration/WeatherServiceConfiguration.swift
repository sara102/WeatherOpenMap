//
//  WeatherServiceConfiguration.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Alamofire

class WeatherServiceConfiguration: EndPointConfiguration {

    override var url: String { return Constants.kWeatherBaseURL}
    override var httpMethod: HTTPMethod { return .get}
    override var encoding: ParameterEncoding { return URLEncoding.default }
}
