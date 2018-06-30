//
//  Dictionary.swift
//  WeatherApp
//
//  Created by Sara AbdulRaheem on 6/28/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import Foundation


//MARK:- overloading += operator  for Dictionary type
func += <KeyType, ValueType> (left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

//MARK:- overloading += operator  for Dictionary? type
func += <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>?, right: Dictionary<KeyType, ValueType>?) {
    if let _ = right {
        for (k, v) in right! {
            if let _ = left {
                left?[k] = v
            }
            else {
                left = [:]
                left?[k] = v
            }
        }
    }
}



//MARK:- overloading -= operator  for Dictionary type
func -= <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, _) in right {
        left.removeValue(forKey: k)
    }
}

//MARK:- overloading -= operator  for Dictionary? type
func -= <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>?, right: Dictionary<KeyType, ValueType>?) {
    if let _ = right {
        for (k, _) in right! {
            left?[k] = nil
        }
    }
}
