//
//  AllRestaurants.swift
//  FoodPinApp
//
//  Created by Pedro Meira on 20/02/2018.
//  Copyright © 2018 Pedro Meira. All rights reserved.
//

import Foundation

class AllRestaurants {
    
    func allRestaurants() {
        var restaurant = [["Cafe Deadend",  "Coffee & Tea Shop",  "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", "232-923423", "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", "Cafe Deadend", false],
                          ["Homei",  "Cafe",  "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", "348-233423", "A little gem hidden at the corner of the street is nothing but fantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", "Homei", false],
                          ["Teakha",  "Tea House",  "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", "354-243523", "Take a moment to stop and smell tealeaves! We are about the community, our environment, and all things created by the warmth of our hands. We open at 11 AM, and close at 7 PM. At teakha, we sell only the best single-origin teas sourced by our sister company Plantation directly from small tea plantations. The teas are then either cooked to perfection with milk in a pot or brewed.", "Teakha", false],
                          ["Cafe Loisl",  "Austrian / Causual Drink",  "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", "453-333423", "A great cafe in Austrian style. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. We also serve breakfast and light lunch. Come over to enjoy the elegant ambience and quality coffee..", "Cafe Loisl", false],
                          ["Petite Oyster",  "French",  "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", "983-284334", "An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan.", "Petite Oyster", false],
                          ["For Kee Restaurant",  "Hong Kong",  "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", "232-434222", "A great local cafe for breakfast and lunch! Located in a quiet area in Sheung Wan, we offer pork chop buns, HK french toast, and many more. We open from 7 AM to 4:30 PM.", "For Kee Restaurant", false],
                          ["Po's Atelier",  "Bakery",  "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", "234-834322", "A boutique bakery focusing on artisan breads and pastries paired with inspiration from Japan and Scandinavia. We are crazy about bread and excited to share our artisan bakes with you. We open at 10 every morning, and close at 7 PM.", "Po's Atelier", false],
                          ["Bourke Street Backery",  "Chocolate",  "633 Bourke St Sydney New South Wales 2010 Surry Hills", "982-434343", "We make everything by hand with the best possible ingredients, from organic sourdoughs to pastries and cakes. A combination of great produce, good strong coffee, artisanal skill and hard work creates the honest, soulful, delectable bites that have made Bourke Street Bakery famous. Visit us at one of our many Sydney locations!", "Bourke Street Backery", false],
                          ["Haigh's Chocolate",  "Cafe",  "412-414 George St Sydney New South Wales", "734-232323", "Haigh's Chocolates is Australia's oldest family owned chocolate maker. We have been making chocolate in Adelaide, South Australia since 1915 and we are committed to the art of premium chocolate making from the cocoa bean. Our chocolates are always presented to perfection in our own retail stores. Visit any one of them and you'll find chocolate tasting, gift wrapping and personalised attention are all part of the service.", "Haigh's Chocolate", false],
                          ["Palomino Expresso",  "American / Seafood",  "Shop 1 61 York St Sydney New South Wales", "872-734343", "We offer an assortment of on-site baked goods and sandwiches. This place has always been a favourite among office workers. We open at 7 every morning including Sunday, and close at 4 PM. Come over, have a coffee and enjoy a chit-chat with our baristas.", "Palomino Expresso", false],
                          ["Upstate",  "Seafood",  "95 1st Ave New York, NY 10003", "343-233221", "The absolute best seafood place in town. The atmosphere here creates a very homey feeling. We open at 5 PM, and close at 10:30 PM. ", "Upstate", false],
                          ["Traif",  "American",  "229 S 4th St Brooklyn, NY 11211", "985-723623", "A young crowd populates this pork-focused American eatery in an older Williamsburg neighborhood. We open at 6PM, and close at 11 PM. If you enjoy a shared small plates dinner experience, come over and have a try.", "Traif", false],
                          ["Graham Avenue Meats",  "Breakfast & Brunch",  "445 Graham Ave Brooklyn, NY 11211", "455-232345", "Classic Italian deli & butcher draws patrons with meat-filled submarine sandwiches. We use the freshest meats and veggies to create the perfect panini for you. We look forward to seeing you!", "Graham Avenue Meats", false],
                          ["Waffle & Wolf",  "Coffee & Tea",  "413 Graham Ave Brooklyn, NY 11211", "434-232322", "Small shop, some seating, definitely something different! We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of waffles with choices of sweet & savory fillings. If you are gluten free and craving waffles, this is the place to go.", "Waffle & Wolf", false],
                          ["Five Leaves",  "Bistro",  "18 Bedford Ave Brooklyn, NY 11222", "343-234553", " Great food, cocktails, ambiance, service. Nothing beats having a warm dinner and a whiskey. We open at 8 every morning, and close at 1 AM. The ricotta pancakes are something you must try.", "Five Leaves", false],
                          ["Cafe Lore",  "Latin American",  "Sunset Park 4601 4th Ave Brooklyn, NY 11220", "342-455433", "Good place, great environment and amazing food! We open at 10 every morning except Sunday, and close at 9 PM. Give us a visit! Enjoy mushroom raviolis, pumpkin raviolis, meat raviolis with sausage and peppers, pork cutlets, eggplant parmesan, and salad.", "Cafe Lore", false],
                          ["Confessional",  "Spanish",  "308 E 6th St New York, NY 10003", "643-332323", "Most delicious cocktail you would ever try! Our menu includes a wide range of high quality internationally inspired dishes, vegetarian options, and local cuisine. We open at 10 AM, and close at 10 PM. We welcome you into our place to enjoy a meal with your friends.", "Confessional", false],
                          ["Barrafina",  "Spanish",  "54 Frith Street London W1D 4SL United Kingdom", "542-343434", "a collection of authentic Spanish Tapas bars in Central London! We have an open kitchen, a beautiful marble-topped bar where guests can sit and watch the chefs at work and stylish red leather stools. Lunch starts at 1 PM. Dinners starts 5:30 PM.", "Barrafina", false],
                          ["Donostia",  "Spanish",  "10 Seymour Place London W1H 7ND United Kingdom", "722-232323", "Very good basque food, creative dishes with terrific flavors! Donostia is a high end tapas restaurant with a friendly relaxed ambiance. Come over to enjoy awesome tapas!", "Donostia", false],
                          ["Royal Oak",  "British",  "2 Regency Street London SW1P 4BZ United Kingdom", "343-988834", "Specialise in great pub food. Established in 1872, we have local and world lagers, craft beer and a selection of wine and spirits for people to enjoy. Don't forget to try our range of Young's Ales and Fish and Chips.", "Royal Oak", false],
                          ["CASK Pub and Kitchen",  "Thai",  "22 Charlwood Street London SW1V 2DY Pimlico", "432-344050", "With kitchen serving gourmet burgers. We offer food every day of the week, Monday through to Sunday. Join us every Sunday from 4:30 – 7:30pm for live acoustic music!", "CASK Pub and Kitchen", false]]
        
        
        for fRestaurant in restaurant {
            
            let rName = fRestaurant[0] as! String
            let rType = fRestaurant[1] as! String
            let rLocation = fRestaurant[2] as! String
            let rPhone = fRestaurant[3] as! String
            let rDescription = fRestaurant[4] as! String
            let rImage = fRestaurant[5] as! String
            let rIsVisited = fRestaurant[6] as! Bool
            
            let newRestaurant = Restaurant.init(name: rName, type: rType, location: rLocation, phone: rPhone, description: rDescription, image: rImage, isVisited: rIsVisited)
            DataController.sharedDataController.addRestaurant(restaurant: newRestaurant)
        }
    }
}
