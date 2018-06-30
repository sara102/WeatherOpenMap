//
//  AddCityWithSuggestionViewController+UITextField.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit
extension AddCityWithSuggestionViewController:UITextFieldDelegate
{
    @IBAction func textFieldChangedEditing(_ sender: Any) {
        let textField = sender as! UITextField
        self.addCityWithSuggestionHandler?.citySuggestionsByName(city: textField.text!)
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.suggestions.removeAll()
        self.suggestionsTableView.reloadData()
        self.suggestionsTableView.isHidden = true
        return true
    }
}
