//
//  BaseService.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/28/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

class BaseService
{
    static var className: String { return "\(self)" }
    class var notificationName:Notification.Name  { return Notification.Name(className) }
    
    var delegate: Connectable

    var queue:[String] = []
    
    
    public static let DataReceivedKey = "Data Received Successfully"
    public static let DataReceivedWithErrorKey = "Data received with  errors"
    public static let DataReceivedWithErrorResponseKey = "Data received with  error response"

    public static let ServiceName = "Service name"
    
    required init(delegate: Connectable) {
        self.delegate = delegate
    }
    

    func execute(data:Any?,tag:String,headers:[String:String]?) {
        
        let request = Request(tag: tag)
        
        if let _ = headers  {
            request.addHeaders(headers: headers!)
        }
        
        if let params = data as? [String:Any] {
            request.addParameters(parameters: params)
        }
        else if let params = data as? [Any] {
            request.url =  request.url +  encodeURL(parameters: params)
        }

        
        startRequest(request: request)
        
    }
    
    func encodedParamters(parameters:[String:Any])->[String:Any] {
        //Override this method to customize  paramters encoding
        let data = parameters
        return data
    }
    
    
    func encodeURL(parameters:[Any])->String {
        var queryString = ""
        
        for value in parameters {
            queryString += "\(value)/"
        }
        if queryString.count > 0
        {
            queryString.removeLast()
        }
        return queryString
    }
    
    
    func startRequest(request:Request){
        

            let appDelegate =  UIApplication.shared.delegate as? AppDelegate
            
            if appDelegate?.internetReachable() == true {
                HttpManager.execute(request: request, encoding: request.encoding, successClosure: {responseData in
                    
                    self.processReceivedData(responseData: responseData, requestId: request.tag)
                    
                }) { error,errorResponse  in

                    self.requestDidFail(error: error,errorResponse: errorResponse, tag:request.tag)
                }
            }
            else {
                //
                let error = WAError(code: Constants.kInternetIsNotReachableErrorCode, message:NSLocalizedString("internet_is_not_reachable_error_msg", comment: ""))
                self.requestDidFail(error: error,errorResponse:[:], tag:request.tag)
            }
        
    }
    
    func processReceivedData(responseData: Any, requestId: String){
        assertionFailure("You should override this method")
    }
    
    
    
    //MARK:- Sucess
    func requestDidSuccess(responseData: Any, requestId: String){
        delegate.requestDidSuccess(responseData: responseData,service:requestId)
    }
    
    
    
    //MARK:- Do any logic related to failure case plus at end send notification
    func requestDidFail(error: WAError,errorResponse:Dictionary<String,Any>,tag: String){
        delegate.requestDidFail (error: error,errorResponse: errorResponse,service:tag)
    }
    
    
    
  
    
    

    
    
   
}
