//
//  MoreTableViewCell.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/19/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    @IBOutlet weak var moreMenuLabel: UILabel!
    @IBOutlet weak var moreMenuImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
