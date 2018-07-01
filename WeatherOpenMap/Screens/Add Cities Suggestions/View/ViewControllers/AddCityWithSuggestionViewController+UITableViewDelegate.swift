//
//  AddCityWithSuggestionViewController+UITableViewDelegate.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//
import UIKit

extension AddCityWithSuggestionViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.suggestionsTableView
        {
            
            return  self.suggestions.count
        }
        else
        {
            return self.weatherList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.suggestionsTableView
        {
            let cell = tableView.dequeueReusableCell(withIdentifier:CitySuggestionCellUITableViewCell.cellIdentifier) as! CitySuggestionCellUITableViewCell
            cell.citySuggestionLabel.text = self.suggestions[indexPath.row].cityDescription()
            self.suggestionsTableViewConstraint.constant = self.suggestionsTableView.contentSize.height

            return cell

        }
        else
        {
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
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.suggestionsTableView
        {
           self.showActivityIndicator()
           self.addCityWithSuggestionHandler?.saveCityInFavoriateList(city: self.suggestions[indexPath.row])
        }

    }
    
    
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(tableView  == self.favoriateCitiesTableView)
        {
            if (editingStyle == UITableViewCellEditingStyle.delete) {
                self.addCityWithSuggestionHandler?.deleteCityFromFavoriateList(city: self.weatherList[indexPath.row])
            }
        }
   
    }
    
    
   
    
}
