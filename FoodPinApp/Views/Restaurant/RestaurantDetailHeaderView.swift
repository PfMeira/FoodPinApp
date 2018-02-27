//
//  RestaurantDetailHeaderView.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 16/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {

    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel: UILabel! {
        didSet {
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true
        }
    }
    @IBOutlet var heartImageView: UIImageView! {
        didSet{
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .white
        }
    }
    @IBOutlet var ratingImageView: UIImageView!
    
    func configurationCell(restaurant: Restaurant) {
      
        headerImageView.image = UIImage(named: restaurant.image)
        nameLabel.text = restaurant.name
        typeLabel.text = restaurant.type
        typeLabel.layer.cornerRadius = 5
        heartImageView.isHidden = (restaurant.isVisited) ? false : true
    }
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
