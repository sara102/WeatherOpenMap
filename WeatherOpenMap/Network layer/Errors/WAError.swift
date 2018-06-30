//
//  WAError.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/28/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation

struct WAError: Error
{

    var message:String
    var code:Int
    
    
    
    //MARK:- Intializer
    init(code: Int, message: String) {
        self.message = message
        self.code = code
    }
    
    init(error: Error) {
        message = error.localizedDescription
        code = 0
    }
}
