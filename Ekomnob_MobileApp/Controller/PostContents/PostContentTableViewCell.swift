//
//  PostTableViewCell.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/18/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit

class PostContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var languageTextField: UITextField!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTypeTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var youtubeUrlTextField: UITextField!
    @IBOutlet weak var shortDescTextField: UITextField!
    @IBOutlet weak var longDescTextField: UITextField!
    
    override func awakeFromNib() {
    
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
