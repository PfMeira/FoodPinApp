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
    
    let name: String
    let location: String
    let type: String
    let description: String
    let phone: String
    let image: String
    var isVisited: Bool

    //init(data: [Any]) {
    init(name: String, type: String, location: String, phone: String, description: String, image: String, isVisited: Bool) {

        self.name = name //data[0] as! String
        self.type = type //data[2] as! String
        self.location = location //data[1] as! String
        self.phone = phone
        self.description = description
        self.image = image //nameRestaurant
        self.isVisited = isVisited //data[3] as! Bool
    }
    
//    convenience init() {
//        self.init(name: "",  location: "", type: "", imageName: "", isVisited: false)
//    }
}

extension Restaurant {
    
    convenience init() {
        self.init(name: "",  type: "", location: "", phone: "", description: "", image: "", isVisited: false)
    }
}

