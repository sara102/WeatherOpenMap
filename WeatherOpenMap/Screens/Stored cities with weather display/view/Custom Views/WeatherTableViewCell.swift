//
//  WeatherTableViewCell.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/30/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    @IBOutlet var dayLabelCollection: [UILabel]!
    
    
    @IBOutlet var maxTempLabelCollection: [UILabel]!
    @IBOutlet var minTempLabelCollection: [UILabel]!
    
    @IBOutlet var humadityLabelCollection: [UILabel]!

    static let cellIdentifier:String = "WeatherTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
