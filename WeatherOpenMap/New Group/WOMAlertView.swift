//
//  WOMAlertView.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

struct WOMAlertView {

    public static func createAlertView(title:String,messege:String,actions:[UIAlertAction]) ->UIAlertController
    {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: UIAlertControllerStyle.alert)
        for action in actions
        {
            alert.addAction(action)
        }
        return alert
    }
    
    public static func createAlertViewWithDefaultButton(title:String,messege:String) ->UIAlertController
    {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("alert_default_ok_button_title", comment: ""), style: UIAlertActionStyle.default, handler: nil))
        return alert
    }
    
}
