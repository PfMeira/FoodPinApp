//
//  RestaurantDetailViewController.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 14/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restauranLocationLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantImageView: UIImageView!
    
    var restauranteName: String!
    var restaurantlocation: String!
    var restaurantType: String!
    var restaurantImageName = ""
    
    var restaurantDetails: [Restaurant] = [Restaurant]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        restaurantNameLabel.text = restauranteName
        restauranLocationLabel.text = restaurantlocation
        restaurantTypeLabel.text = restaurantType
        restaurantImageView.image = UIImage(named: restaurantImageName)        
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
