
//
//  UIViewController+ActivityIndicator.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

extension UIViewController
{
    func showActivityIndicator()  {
        let blockingView = UIView.init(frame: self.view.frame)
        blockingView.backgroundColor = UIColor.clear
        blockingView.tag = 10000
        self.view.addSubview(blockingView)
        WOMActivityIndicator.showActivityIndicator()
    }
    
    func hideActivityIndicator()  {
        self.view.viewWithTag(10000)?.removeFromSuperview()
        WOMActivityIndicator.hideActivityIndicator()
    }
    
    
    // overload this method if u want to make more alerts
    func showAlertViewWithDefaultButton(title:String,messege:String)
    {
        let alert = WOMAlertView.createAlertViewWithDefaultButton(title: title, messege: messege)
        self.present(alert, animated: true, completion: nil)

    }
}
