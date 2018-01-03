//
//  ReviewViewController.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 02/01/2018.
//  Copyright © 2018 Pedro Meira. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
        
        //Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        
        for rateButton in rateButtons {
            rateButton.transform = moveRightTransform
            rateButton.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2.0) {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[4].alpha = 1.0
//
            UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
                self.rateButtons[0].alpha = 1.0
                self.rateButtons[0].transform = .identity
            }, completion: nil)
            
            UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
                self.rateButtons[1].alpha = 1.0
                self.rateButtons[1].transform = .identity
            }, completion: nil)
            
            UIView.animate(withDuration: 0.4, delay: 0.50, options: [], animations: {
                self.rateButtons[2].alpha = 1.0
                self.rateButtons[2].transform = .identity
            }, completion: nil)
            
            UIView.animate(withDuration: 0.4, delay: 0.75, options: [], animations: {
                self.rateButtons[3].alpha = 1.0
                self.rateButtons[3].transform = .identity
            }, completion: nil)
            
            UIView.animate(withDuration: 0.4, delay: 0.99, options: [], animations: {
                self.rateButtons[4].alpha = 1.0
                self.rateButtons[4].transform = .identity
            }, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

