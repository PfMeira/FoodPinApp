//
//  ListTableViewController.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 07/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController {

    var restaurants = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Choc olate", "Palomino Expresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitche"]

    var restaurantNames = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for nameItem in restaurants {
            
            let newRestaurant = Restaurant.init(name: nameItem)
            restaurantNames.append(newRestaurant)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
}

extension ListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as UITableViewCell
        let nameRestaurant = restaurantNames[indexPath.row]
        cell.textLabel?.text = nameRestaurant.nameRest
        
        if let imageName = nameRestaurant.imageNameRest {
            cell.imageView?.image = UIImage(named: imageName)
        }
        return cell
    }
}
