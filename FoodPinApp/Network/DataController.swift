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
    
    func printRealm() {
        print(realm.configuration.fileURL)
    }
    
    func isEmpety() {
        
        removeAllRestaurants()
        
        if !realm.isEmpty {
            print("vazia")
            returnAllRestaurants()
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
    
    func returnAllRestaurants(){ //} -> [Restaurant] {
        
        try! realm.write {
            let restraunt = realm.objects(Restaurant.Type)
            
            print(restraunt)
        }
        
//        return Restaurant()
    }
}
