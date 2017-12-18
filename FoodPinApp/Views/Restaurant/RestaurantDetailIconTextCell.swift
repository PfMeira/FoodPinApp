//
//  RestaurantDetailIconTextCell.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 17/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

class RestaurantDetailIconTextCell: UITableViewCell {
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var shortTextLabel: UILabel! {
        didSet {
            shortTextLabel.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
