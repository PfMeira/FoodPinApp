//
//  ListTableViewController.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 07/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit
import RealmSwift


class ListTableViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    // MARK: - Variable
    var restaurantIsVisited = Array(repeating: false, count: 21)
    //var restaurants = [Restaurant]()
    
    let dataContollerShared = DataController.sharedDataController
    var restaurants: Results<Restaurant>?
    
    
    // MARK: - View Controller life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // dataContollerShared.removeAllRestaurants()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //AllRestaurants().allRestaurants()
        restaurants = DataController.sharedDataController.getAllRestaurants()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) { //UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedStringKey.font: customFont]
        }
        navigationController?.hidesBarsOnSwipe = false
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  override var prefersStatusBarHidden: Bool {
    //     return true
    //  }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "showRestauranteDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                guard let cRestaurant = restaurants?[indexPath.row] else {
                    return
                }
                let destination = segue.destination as! RestaurantDetailViewController
                destination.restaurant = cRestaurant
            }
        }
    }
    
    // MARK: - Close Button
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Table view delegate


extension ListTableViewController: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate Protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let cRestaurant = restaurants?[indexPath.row] else {
            return UISwipeActionsConfiguration()
        }
        
        let delectAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            // Delete the row from the data source
            self.dataContollerShared.deleteRestaurant(restaurant: cRestaurant)
            self.tableView.reloadData()
            completionHandler(true)
        }
        
        delectAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        delectAction.image = UIImage(named: "delete")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just checkin in at \(cRestaurant)"
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: cRestaurant.name) {
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
        
        guard let cRestaurant = restaurants?[indexPath.row] else {
            return UISwipeActionsConfiguration()
        }
        
        let checkInAction = UIContextualAction(style: .normal, title: "Check In") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            if cRestaurant.isVisited == false {
                cell.isHiddenCheckIn(hidden: false)
                self.dataContollerShared.updateIsVisitedRestaurant(restaurant: cRestaurant)
                
            } else {
                
                cell.isHiddenCheckIn(hidden: true)
                self.dataContollerShared.updateIsVisitedRestaurant(restaurant: cRestaurant)
            }
            completionHandler(true)
        }
        if cRestaurant.isVisited == false {
            checkInAction.backgroundColor = UIColor(red: 39, green: 174, blue: 96)
            checkInAction.image = UIImage(named: "tick")
            
        } else {
            checkInAction.backgroundColor = UIColor(red: 39, green: 174, blue: 96)
            checkInAction.image = UIImage(named: "undo")
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        return swipeConfiguration
    }
}

// MARK: - Table view data source

extension ListTableViewController: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let cRestaurants = restaurants else {
            return 0
        }
        return cRestaurants.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //TODO   restaurantNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cRestaurant = restaurants?[indexPath.row] else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! RestaurantTableViewCell
        cell.configurationCell(restaurant: cRestaurant)
        
        return cell
    }
}

