//
//  Restaurant.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 07/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

//struct
class Restaurant {
    
    let nameRestaurant: String
    let locationRestaurant: String
    let typeRestaurant: String
    let imageNameRestaurant: String
    var isVisitedRestaurant: Bool
    
    //init(data: [Any]) {
    init(name: String,  location: String, type: String, imageName: String, isVisited: Bool) {
    
        nameRestaurant = name //data[0] as! String
        locationRestaurant = location //data[1] as! String
        typeRestaurant = type //data[2] as! String
        imageNameRestaurant = imageName //nameRestaurant
        isVisitedRestaurant = isVisited //data[3] as! Bool
    }
    
//    convenience init() {
//        self.init(name: "",  location: "", type: "", imageName: "", isVisited: false)
//    }
}

extension Restaurant {
    
    convenience init() {
        self.init(name: "",  location: "", type: "", imageName: "", isVisited: false)
    }
}

