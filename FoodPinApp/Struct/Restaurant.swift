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
    
    init(data: [String]) {

        nameRestaurant = data[0]
        locationRestaurant = data[1]
        typeRestaurant = data[2]
        imageNameRestaurant = nameRestaurant
    }
}
