//
//  FoodList.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user191016 on 3/7/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit

class FoodList: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    var dataName:[String] = ["Chicken Burger", "Beef Burger", "Vegie Burger", "Seafood Burger"]
    var dataImage:[UIImage] = [ #imageLiteral(resourceName: "Food2"), #imageLiteral(resourceName: "Food2"), #imageLiteral(resourceName: "Food3"), #imageLiteral(resourceName: "Food2")]
    var dataPrice:[Int] = [550, 600, 450, 700]
    var dataDesc:[String] = ["We are well known for our chicken burger as it grabs the tastes from western cousine and sprinkles it with local spices.", "Enjoy one of our juicy beef burgers, which has just enough of everything you like. Multiple flavors are put in order to make this perfect burger.", "This is our fully vegan friendly burger making sure everyone can share the joy.Perfect one to order if you are on a diet or vegan.", "Seafood burger is our chefs special offering to you to make your taste buds go crazy with all this delcious flavor. Meaning of the word burger changes once you get a taste of our seafood burger."]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataName.count
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
        dataSource = self
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xampleCell", for: indexPath) as! StringCell
        cell.title.text = dataName[indexPath.row]
        cell.price.text = "Rs. " + String(dataPrice[indexPath.row])
        cell.coverImage.image = dataImage[indexPath.row]
        cell.desc.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.desc.numberOfLines = 3
        cell.desc.text = dataDesc[indexPath.row]
        return cell
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
