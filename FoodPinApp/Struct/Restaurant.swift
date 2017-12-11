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
    let imageNameRest: String?
    
    init(name: String, location: String, type: String) {
        nameRestaurant = name
        locationRestaurant = location
        typeRestaurant = type
        imageNameRest = nameRestaurant
    }
}

extension Restaurant {
    
    init(data: [String]) {
        print(data)
        nameRestaurant = data[1]
        locationRestaurant = data[1]
        typeRestaurant = data[2]
        imageNameRest = nameRestaurant
    }
}
