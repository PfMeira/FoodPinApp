//
//  RestaurantDetailMapCell.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 29/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
