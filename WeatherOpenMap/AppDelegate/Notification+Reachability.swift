//
//  Notification+Reachability.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/28/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

extension Notification
{
    
    
    init(name:String) {
        let notificationName = Notification.Name(rawValue: name)
        self =  Notification(name: notificationName)
    }
    
}


extension NSNotification.Name
{
    
    static let reachable = Notification.Name(rawValue:Constants.kInternetIsReachable)
    static let notReachable = Notification.Name(rawValue:Constants.kInternetIsNotReachable)
    
}

