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
    
    let realm = try! Realm()
    
//    func printRealm() {
//        print(realm.configuration.fileURL)
//    }
    
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
        
        //var nRestaurants = [Restaurant]()
        let restraunts = realm.objects(Restaurant.self)
//
//        for nRestaurant  in restraunts {
//            nRestaurants.append(nRestaurant)
//        }
        return restraunts
    }
}
