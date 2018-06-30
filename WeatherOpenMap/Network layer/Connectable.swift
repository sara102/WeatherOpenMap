//
//  Connectable.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//


protocol Connectable {
    func requestDidSuccess(responseData: Any,service:String)->Void
    func requestDidFail(error: WAError,errorResponse: Any,service:String)->Void

}
