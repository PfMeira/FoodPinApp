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

    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restauranLocationLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantImageView: UIImageView!
   
    // MARK: - Variable
    var restauranteName = ""
    var restaurantlocation = ""
    var restaurantType = ""
    var restaurantImageName = ""
    
    var restaurant: Restaurant = Restaurant()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        self.title = restaurant.nameRestaurant
        
        restaurantNameLabel.text = restaurant.nameRestaurant
        restauranLocationLabel.text = restaurant.locationRestaurant
        restaurantTypeLabel.text = restaurant.typeRestaurant
        restaurantImageView.image = UIImage(named: restaurant.imageNameRestaurant)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
