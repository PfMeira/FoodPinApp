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
            _ = getAllRestaurants()
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
    
    func addRestaurant(restaurant: Restaurant) {
        print(restaurant)
        try! realm.write {
            realm.add(restaurant)
        }
    }
    
    func getAllRestaurants() -> Results <Restaurant> {
        let restraunts = realm.objects(Restaurant.self)
        return restraunts
    }
    
    func deleteRestaurant(restaurant: Restaurant) {
        try! realm.write {
            realm.delete(restaurant)
        }
    }
    
    func updateIsVisitedRestaurant(restaurant: Restaurant) {
        try! realm.write {
            restaurant.setValue(!restaurant.isVisited, forKeyPath: "isVisited")
            realm.add(restaurant, update: true)
        }
    }
}
