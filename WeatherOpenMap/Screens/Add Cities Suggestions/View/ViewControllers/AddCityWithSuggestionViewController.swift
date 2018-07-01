//
//  AddCityWithSuggestionViewController.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit
import ARSLineProgress

class AddCityWithSuggestionViewController: UIViewController {
    
    @IBOutlet weak var suggestionsTableViewConstraint: NSLayoutConstraint!
    
    //MARK:UI Outlets
    @IBOutlet weak var suggestionsTableView: UITableView!

    @IBOutlet weak var favoriateCitiesTableView: UITableView!
    
    //MARK:Properties
    var suggestions:[CityDTO] = []
    var weatherList:[CityDTO] = []

    var addCityWithSuggestionHandler: AddCityWithSuggestionHandler?
    
    //MARK:Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddCityWithSuggestionsController()
        self.showActivityIndicator()
        self.addCityWithSuggestionHandler?.weatherForUserCurrentCityIfApplicable()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.showActivityIndicator()
         self.addCityWithSuggestionHandler?.fetchFavoriateCitiesWeather()
    }

    // Initializations
    func setupAddCityWithSuggestionsController() -> Void {
        self.addCityWithSuggestionHandler = AddCityWithSuggestionController()
        self.addCityWithSuggestionHandler?.addCityWithSuggestionDelegate = self
        
    }
    
    
    func showSuggestionsView()
    {
        UIView.animate(withDuration: 0.3) {
            self.suggestionsTableView.isHidden = false

        }
    }
    func hideSuggestionsView()
    {
        UIView.animate(withDuration: 0.3) {
            self.suggestionsTableView.isHidden = true
            
        }
    }
}


extension AddCityWithSuggestionViewController: AddCityWithSuggestionDelegate {
 
    func notifyWithError(error: String) {
        self.hideActivityIndicator()
        self.showAlertViewWithDefaultButton(title: "", messege:error)

    }
    func updateUIWithWeatherList(weatherList: [CityDTO]) {
        self.hideActivityIndicator()
        self.weatherList = weatherList
        self.favoriateCitiesTableView.reloadData()
    }
    func notifyForCityAddeddSuccessfully() {
        self.hideActivityIndicator()
        self.hideSuggestionsView()
    }
    func notifyForCitiesExceededSpecifiedLimit() {
        self.hideActivityIndicator()
        self.showAlertViewWithDefaultButton(title: "", messege:       NSLocalizedString("city_number_of_cities_exceeded_alert_messege", comment: ""))
    }

    func updateUIWithCitiesList(suggestions: [CityDTO]) -> Void {
        self.hideActivityIndicator()
        self.suggestions = suggestions
        if (self.suggestions.isEmpty == true)
        {
            self.hideSuggestionsView()
        }
        else
        {
            self.showSuggestionsView()
        }

        self.suggestionsTableView.reloadData()
    }
}






