//
//  PostContentTableViewController.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/13/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit

class PostContentTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.keyboardDismissMode = .onDrag
        self.hideKeyboardWhenTappedAround()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 620
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POSTCONTENTCELL", for: indexPath) as! PostContentTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        
        
        return cell
    }
    
}
