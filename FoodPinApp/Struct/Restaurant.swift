//
//  Restaurant.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 07/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

struct Restaurant{
    
    let nameRest: String
    let imageNameRest: String?
    
    init(name: String) {
        nameRest = name
        let nameImage = name.components(separatedBy: .whitespaces).joined().lowercased()
        print(nameImage)
        imageNameRest = nameImage
    }
}
