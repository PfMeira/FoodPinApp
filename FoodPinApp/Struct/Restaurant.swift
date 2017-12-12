//
//  Restaurant.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 07/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

struct Restaurant{
    
    let nameRestaurant: String
    let locationRestaurant: String
    let typeRestaurant: String
    let imageNameRestaurant: String
    var isVisitedRestaurant: Bool
    
    init(data: [Any]) {

        nameRestaurant = data[0] as! String
        locationRestaurant = data[1] as! String
        typeRestaurant = data[2] as! String
        imageNameRestaurant = nameRestaurant
        isVisitedRestaurant = data[3] as! Bool
    }
}
