//
//  StringCell.swift
//  DileeshaNayanajith-COBSCComp192-056
//
//  Created by user191016 on 3/7/21.
//  Copyright © 2021 user162257. All rights reserved.
//

import UIKit

class StringCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
