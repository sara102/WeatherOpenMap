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
        return  self.suggestions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:CitySuggestionCellUITableViewCell.cellIdentifier) as! CitySuggestionCellUITableViewCell
        cell.citySuggestionLabel.text = self.suggestions[indexPath.row].cityDescription()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           self.addCityWithSuggestionHandler?.saveCityInFavoriateList(city: self.suggestions[indexPath.row])

    }
    
    
   
    
}
