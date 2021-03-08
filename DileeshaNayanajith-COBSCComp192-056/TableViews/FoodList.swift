//
//  FoodList.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user191016 on 3/7/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit

class FoodList: UITableView,UITableViewDelegate,UITableViewDataSource {
    var data:[String] = ["Banaa","Mango","Apple"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
        dataSource = self
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xampleCell", for: indexPath) as! StringCell
        cell.title.text = data[indexPath.row]
        return cell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
