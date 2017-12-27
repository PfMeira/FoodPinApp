//
//  RestaurantDetailViewController.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 14/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet var headerView: RestaurantDetailHeaderView!
   
    // MARK: - Variable
    var restaurant: Restaurant = Restaurant()
    
    // MARK: - Status Bar Light Style

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View Did Load

    override func viewDidLoad() {

        super.viewDidLoad()
        
        // MARK: - NavigationViewController
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.hidesBarsOnSwipe = false
        
        // MARK: - Table View
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        
        // MARK: - NavigationViewController
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.typeLabel.layer.cornerRadius = 5 
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      override var prefersStatusBarHidden: Bool {
         return true
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension RestaurantDetailViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantDetailIconTextCell", for: indexPath) as! RestaurantDetailIconTextCell
            // String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(named: "phone")
            cell.shortTextLabel.text = restaurant.phone
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(named: "map")
            cell.shortTextLabel.text = restaurant.location
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.description
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail ciew cont roller")
        }
    }
}

extension RestaurantDetailViewController: UITableViewDelegate {
}

