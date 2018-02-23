//
//  RestaurantTableViewCell.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 09/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
   
    // MARK: - IBOutlet
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2 //30
            thumbnailImageView.clipsToBounds = true
        }
    }
    @IBOutlet var checkInImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurationCell(restaurant: Restaurant) {
        print(restaurant)
        
        nameLabel.text = restaurant.name
        locationLabel.text = restaurant.location
        typeLabel.text = restaurant.type
        checkInImageView.isHidden = restaurant.isVisited ? false : true
        
        let imageName = restaurant.image
        thumbnailImageView.image = UIImage(named: imageName)
        thumbnailImageView.layer.borderWidth = 3
        thumbnailImageView.layer.borderColor = UIColor.orange.cgColor
    }
    
    func isHiddenCheckIn(hidden: Bool) {
        checkInImageView.isHidden = hidden
    }
}
