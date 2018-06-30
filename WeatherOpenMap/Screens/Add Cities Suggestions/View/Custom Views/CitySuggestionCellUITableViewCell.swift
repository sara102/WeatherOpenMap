//
//  CitySuggestionCellUITableViewCell.swift
//  WeatherOpenMap
//
//  Created by Sara AbdulRaheem on 6/29/18.
//  Copyright © 2018 Sara AbdulRaheem. All rights reserved.
//

import UIKit

class CitySuggestionCellUITableViewCell: UITableViewCell {
    static let cellIdentifier:String = "CitySuggestionCellUITableViewCell"
    @IBOutlet weak var citySuggestionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
