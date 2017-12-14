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
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var restaurant = [["Cafe Deadend", "Hong kong","Coffee & Tea Shop", false],
                      ["Homei", "Hong kong","Cafe", false],
                      ["Teakha","Hong kong","Austrian / Causal Drink", false],
                      ["Cafe Loisl","Hong kong","French", false],
                      ["Petite Oyster","Hong kong ","Bakery", false],
                      ["For Kee Restaurant","Hong kong ","Bakery", false],
                      ["Po's Atelier", "Hong kong ","Chocolate", false],
                      ["Bourke Street Bakery", "Sydney","Cafe", false],
                      ["Haigh's Choc olate","Sydney", "American / Seafood", false],
                      ["Palomino Expresso", "Sydney", "American", false],
                      ["Upstate", "New York","American", false],
                      [ "Traif","New York", "Breakfast & Brunch", false],
                      ["Graham Avenue Meats And Deli", "New York", "Coffee & Tea", false],
                      ["Waffle & Wolf", "New York", "Coffee & Tea ", false],
                      [ "Five Leaves","NewYork","Latin American", false],
                      ["Cafe Lore","New York", "Spanish", false],
                      ["Confessional","New York", "Spanish", false],
                      ["Barrafina","London","Spanish", false],
                      ["Donostia","London","British", false],
                      ["Royal Oak","London", "Thai", false],
                      ["CASK Pub and Kitche",  "London", "Tea House", false]]
    
    
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
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
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        //Add call Action
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        // Check-in action
        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: { (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            //cell?.accessoryType = .checkmark
            if self.restaurantNames[indexPath.row].isVisitedRestaurant == false {
                cell.checkInImageView.isHidden = false
                self.restaurantNames[indexPath.row].isVisitedRestaurant = true
            }
        })
        optionMenu.addAction(checkInAction)
        
        let confirmActionHandler = { (action: UIAlertAction!) -> Void in
            let optionAlert = UIAlertController(title: "Confirm cancel", message: "Are you sure you want to cancel", preferredStyle: .alert)
            let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let acceptAlert = UIAlertAction(title: "Remove", style: .default, handler: { (action: UIAlertAction) in
                let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
                //cell?.accessoryType = .none
                cell.checkInImageView.isHidden = true
                self.restaurantNames[indexPath.row].isVisitedRestaurant = false
            })
            optionAlert.addAction(acceptAlert)
            optionAlert.addAction(cancelAlert)
            self.present(optionAlert, animated: true, completion: nil)
        }
        let callActionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: confirmActionHandler)
        optionMenu.addAction(callActionCancel)
        
        present(optionMenu, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print(indexPath.row)
        return indexPath
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delectAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            self.restaurantNames.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)

            completionHandler(true)
        }
        delectAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        delectAction.image = UIImage(named: "delete")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just checkin in at \(self.restaurantNames[indexPath.row])"
            let activityController: UIActivityViewController
         
            if let imageToShare = UIImage(named: self.restaurantNames[indexPath.row].nameRestaurant) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delectAction, shareAction])
        return swipeConfiguration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkInAction = UIContextualAction(style: .normal, title: "Check In") { (action, sourceView, completionHandler) in
            
            
            
            completionHandler(true)
        }
        if restaurantNames[indexPath.row].isVisitedRestaurant == false {
            checkInAction.backgroundColor = UIColor(red: 54/255.0, green: 215/255.0, blue: 183/255.0, alpha: 1.0)
            checkInAction.image = UIImage(named: "tick")
            self.restaurantNames[indexPath.row].isVisitedRestaurant = true

        } else {
            checkInAction.backgroundColor = UIColor(red: 54/255.0, green: 215/255.0, blue: 183/255.0, alpha: 1.0)
            checkInAction.image = UIImage(named: "undo")
            self.restaurantNames[indexPath.row].isVisitedRestaurant = false
        }

        print("asdfd")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        return swipeConfiguration
    }
}

extension ListTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
//        if editingStyle == .delete {
//            restaurantNames.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
        //tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nameRestaurant = restaurantNames[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! RestaurantTableViewCell        
        cell.nameLabel.text = nameRestaurant.nameRestaurant
        cell.locationLabel.text = nameRestaurant.locationRestaurant
        cell.typeLabel.text = nameRestaurant.typeRestaurant
        
        let imageName = nameRestaurant.imageNameRestaurant
        cell.thumbnailImageView.image = UIImage(named: imageName)
        cell.thumbnailImageView.layer.borderWidth = 3
        cell.thumbnailImageView.layer.borderColor = UIColor.orange.cgColor
        cell.checkInImageView.image = UIImage(named: "heart-tick")
        
        if nameRestaurant.isVisitedRestaurant == true {
            cell.checkInImageView.isHidden = false
        } else {
            cell.checkInImageView.isHidden = true
        }
        return cell
    }
}

