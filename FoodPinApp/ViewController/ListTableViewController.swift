//
//  ListTableViewController.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 07/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController {

//    var restaurants = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Choc olate", "Palomino Expresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitche"]
//    var restaurantLocations = ["Hong kong", "Hong kong", "Hong kong", "Hong kong", "Hong kong ", "Hong kong ", "Hong kong ", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "NewYork", "New York", "New York", "London", "London", "London", "London"]
//    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causal Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea ", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    
    var restaurant = [["Cafe Deadend", "Hong kong","Coffee & Tea Shop"],["Homei", "Hong kong","Cafe"], [ "Teakha","Hong kong","Austrian / Causal Drink"],[ "Cafe Loisl","Hong kong","French"], ["Petite Oyster","Hong kong ","Bakery"], ["For Kee Restaurant","Hong kong ","Bakery"], ["Po's Atelier", "Hong kong ","Chocolate"], [ "Bourke Street Bakery", "Sydney","Cafe"], ["Haigh's Choc olate","Sydney", "American / Seafood"], ["Palomino Expresso", "Sydney", "American"], ["Upstate", "New York","American"], [ "Traif","New York", "Breakfast & Brunch"],  ["Graham Avenue Meats And Deli", "New York", "Coffee & Tea"], ["Waffle & Wolf", "New York", "Coffee & Tea "] , [ "Five Leaves","NewYork","Latin American"], ["Cafe Lore","New York", "Spanish"], ["Confessional","New York", "Spanish"], ["Barrafina","London","Spanish"], ["Donostia","London","British"] , [   "Royal Oak","London", "Thai"], ["CASK Pub and Kitche",  "London", "Tea House"]]
    

    
    var restaurantNames = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for fRestaurant in restaurant {
            let newRestaurant = Restaurant.init(data: fRestaurant)
            restaurantNames.append(newRestaurant)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//  override var prefersStatusBarHidden: Bool {
//     return true
//  }
}

extension ListTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print(indexPath.row)
        return indexPath
    }
}

extension ListTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! RestaurantTableViewCell
        let nameRestaurant = restaurantNames[indexPath.row]

        cell.nameLabel.text = nameRestaurant.nameRestaurant
        cell.locationLabel.text = nameRestaurant.locationRestaurant
        cell.typeLabel.text = nameRestaurant.typeRestaurant
        
        let imageName = nameRestaurant.imageNameRestaurant
        cell.thumbnailImageView.image = UIImage(named: imageName)
    
        return cell
    }
}

