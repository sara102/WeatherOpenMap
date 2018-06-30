//
//  AddCityWithSuggestionViewController.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit


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
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.addCityWithSuggestionHandler?.fetchFavoriateCitiesWeather()
    }

    // Initializations
    func setupAddCityWithSuggestionsController() -> Void {
        self.addCityWithSuggestionHandler = AddCityWithSuggestionController()
        self.addCityWithSuggestionHandler?.addCityWithSuggestionDelegate = self
        
    }
    
}


extension AddCityWithSuggestionViewController: AddCityWithSuggestionDelegate {
 
    
    func updateUIWithWeatherList(weatherList: [CityDTO]) {
        self.weatherList = weatherList
        self.favoriateCitiesTableView.reloadData()
    }
    func notifyForCityAddeddSuccessfully() {
        self.showAlertViewWithDefaultButton(title: "", messege:       NSLocalizedString("city_added_successfully_alert_messege", comment: ""))
    }
    func notifyForCitiesExceededSpecifiedLimit() {
        self.showAlertViewWithDefaultButton(title: "", messege:       NSLocalizedString("city_number_of_cities_exceeded_alert_messege", comment: ""))
    }

    func updateUIWithCitiesList(suggestions: [CityDTO]) -> Void {
        self.suggestions = suggestions
        if (self.suggestions.isEmpty == true)
        {
            self.suggestionsTableView.isHidden = true
        }
        else
        {
            self.suggestionsTableView.isHidden = false
        }

        self.suggestionsTableView.reloadData()
    }
}






