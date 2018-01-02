//
//  RestaurantDetailMapCell.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 29/12/2017.
//  Copyright © 2017 Pedro Meira. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(localiton: String) {
        
        //Get location
        
        let geoCoder = CLGeocoder()
        print(localiton)
        geoCoder.geocodeAddressString(localiton, completionHandler:{ placemarks, error
            in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks {
                //Get the first placemark
                let placemark = placemarks[0]
                
                //Add annotation
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    // Display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    // Set the zoom level
                    
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: false)
                    
                }
            }
        })
    }
}
