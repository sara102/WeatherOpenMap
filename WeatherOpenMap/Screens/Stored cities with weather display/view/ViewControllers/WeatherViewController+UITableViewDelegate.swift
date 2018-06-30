//
//  WeatherViewController+UITableViewDelegate.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/30/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

extension WeatherViewController:UITableViewDelegate,UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return  self.weatherList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherItem = self.weatherList[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier:WeatherTableViewCell.cellIdentifier) as! WeatherTableViewCell
        cell.errorLabel.isHidden = true

        cell.cityLabel.text = weatherItem.cityDescription()
        
        for number in 0 ..< weatherItem.weatherArray.count {
            cell.dayLabelCollection[number].text = "\(weatherItem.weatherArray[number].dayNumber ?? 0)"
            cell.maxTempLabelCollection[number].text = "\(weatherItem.weatherArray[number].maxTemp ?? 0)"
            cell.minTempLabelCollection[number].text = "\(weatherItem.weatherArray[number].minTemp ?? 0)"
            cell.humadityLabelCollection[number].text = "\(weatherItem.weatherArray[number].humidity ?? 0)RH"

        }
        if(weatherItem.weatherArray.isEmpty)
        {
            cell.errorLabel.isHidden = false
        }
        return cell
    }
    
   
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            self.weatherControllerHandler?.deleteCityFromFavoriateList(city: self.weatherList[indexPath.row])
            
        }
    }
    
}
