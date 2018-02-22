//
//  DataController.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 20/02/2018.
//  Copyright © 2018 Pedro Meira. All rights reserved.
//

import Foundation
import RealmSwift

class DataController {
    
    static let sharedDataController = DataController()
    var realm = try! Realm()

    private init(){
    }
    
    func isEmpty() {
       // removeAllRestaurants()

        if !realm.isEmpty {
            print("vazia")
            _ = returnAllRestaurants()
        } else {
            print("Vazia")
            AllRestaurants().allRestaurants()
        }
    }
    
    func removeAllRestaurants() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func addRestaurant(restaurant: Restaurant) -> Restaurant {
    
        print(restaurant)
        try! realm.write {
            realm.add(restaurant)
        }
        return restaurant
    }
    
    func returnAllRestaurants() -> Results<Restaurant> {
        
        let restraunts = realm.objects(Restaurant.self)
        return restraunts
    }
}
