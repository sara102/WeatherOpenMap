//
//  Request.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/28/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//
import Foundation
import Alamofire

//MARK:- Request
class Request
{
    var id: String
    var tag: String
    
    var httpMethod: String = ""
    var url: String = ""
    var encoding: ParameterEncoding = URLEncoding.default

    
    private  var httpParameters:[String:Any]?
    private  var httpHeaders:[String:String]?
    
    var headers:[String:String]? { return httpHeaders }
    var parameters:[String:Any]? { return httpParameters}
    
    
    
    
    //MARK:- Intializer
    init(tag:String) {
        
        id = tag
        self.tag = tag
        
        let namespace = Bundle.main.infoDictionary![Constants.kBundleName] as! String;
      
        if let configurationClass = NSClassFromString("\(namespace).\(tag)\(Constants.kEndPointClassSuffix)")  as? EndPointConfiguration.Type {
            
            let configuration =  configurationClass.init()
            
            httpMethod = configuration.httpMethod.rawValue
            
            url = configuration.url
                        
            encoding = configuration.encoding
            
        }
    }
    
    convenience init(tag:String, userData: [String:Any]) {
        self.init(tag: tag)
        self.httpParameters += userData
    }
    
    
    
    
    //MARK:- Add http paramters

    func addParameters(parameters: [String:Any]?){
        httpParameters += parameters
    }
    
    
    
//    //MARK:- Add http headers

    func addHeaders(headers: [String:String]){
        httpHeaders += headers
    }
}
