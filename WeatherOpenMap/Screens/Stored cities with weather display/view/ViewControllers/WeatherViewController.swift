//
//  WeatherViewController.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

public class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    
    var weatherControllerHandler: WeatherControllerHandler?
    var weatherList: [CityDTO] = []

    
    //MARK:Life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupWeatherController()

    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.weatherControllerHandler?.fetchFavoriateCitiesWeather()
    }
    
    //Initialize
    func setupWeatherController() -> Void {
      
        self.weatherControllerHandler = WeatherController()
        self.weatherControllerHandler?.weatherControllerDelegate = self
        
    }
    
}


extension WeatherViewController: WeatherControllerDelegate {
  
    func populateWeatherList(weatherList:[CityDTO]) -> Void
    {
        self.weatherList = weatherList
        self.weatherTableView.reloadData()
    }
}









