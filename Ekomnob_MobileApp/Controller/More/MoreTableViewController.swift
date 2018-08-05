//
//  MoreTableViewController.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/19/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {
    
    var menu = ["Forum","News & Events","Join E-Komnob","Sponsors","About us","Contact us","Donate us","Log out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MENUCELL", for: indexPath) as! MoreTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let menuName = menu[indexPath.row]
        cell.moreMenuLabel.text = menuName
        cell.moreMenuImageView.image = UIImage(named: menuName)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: print("0")
                //navigationController?.pushViewController(DonateUsViewController(), animated: true)
        case 1: print("1")
            
        case 2: print("2")
            
        case 3: print("3")
        
        case 4: print("4")
            
        case 5: print("5")
            
        case 6: print("6")
            
        case 7: print("7")
        
        default: break
            
        }
    }

}
