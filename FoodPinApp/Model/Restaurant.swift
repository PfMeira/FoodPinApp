//
//  Restaurant.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 07/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit
import RealmSwift

//struct
class Restaurant: Object {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var location: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var descriptionRest: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var isVisited: Bool = false
    @objc dynamic var rating: String = ""

    //init(data: [Any]) {

    convenience init(name: String, type: String, location: String, phone: String, description: String, image: String, isVisited: Bool, rating: String = "") {

        self.init() // TODO
        self.name = name //data[0] as! String
        self.type = type //data[2] as! String
        self.location = location //data[1] as! String
        self.phone = phone
        self.descriptionRest = description
        self.image = image //nameRestaurant
        self.isVisited = isVisited //data[3] as! Bool
        self.rating = rating
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
//    override static func ignoredProperties() -> [String] {
//        return ["id"]
//    }

    //private
    @discardableResult
    static func createRestaurant(in realm: Realm, nRestaurant: Array<Any>) -> Restaurant {
        //let realm = try! Realm()
        let rName = nRestaurant[0] as! String
        let rType = nRestaurant[1] as! String
        let rLocation = nRestaurant[2] as! String
        let rPhone = nRestaurant[3] as! String
        let rDescription = nRestaurant[4] as! String
        let rImage = nRestaurant[5] as! String
        let rIsVisited = nRestaurant[6] as! Bool
//        let rName = nRestaurant[6]
//        let rName = nRestaurant[]
//
//        try! realm.write {
//            realm.deleteAll()
//        }
        
        let rID = Restaurant(name: rName, type: rType, location: rLocation, phone: rPhone, description: rDescription, image: rImage, isVisited: rIsVisited)
        try! realm.write {
            realm.add(rID)
        }
        return rID
    }

//    convenience init() {
//        self.init(name: "",  location: "", type: "", imageName: "", isVisited: false)
//    }
}

//extension Restaurant {
//    
//    convenience init() {
//        self.init()
//        self.init(name: "",  type: "", location: "", phone: "", description: "", image: "", isVisited: false)
//    }
//}
//
