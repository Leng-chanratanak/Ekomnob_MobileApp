//
//  HomeTableViewController.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/13/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeTableViewController: UITableViewController {
    
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        ContentTypes.contentType(){ ()in
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenHeight-108)/4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CONTENTSTYPECELL", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
       
        
        if(LocalDataStore.ready)
        {
           
            let data = LocalDataStore.contentTypeArray.data[indexPath.row]
            
            let img = data.image_url
            Alamofire.request(img).responseImage { response in
                if let image = response.result.value {
                    cell.contentTypeImageView.image = image
                    cell.contentTypeLabel.text = data.english_name
                    
                }
            }
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: print("0")
                navigationController?.pushViewController(VideoTableViewController(), animated: true)
            
        case 1: print("1")
            
        case 2: print("2")
            
        case 3: print("3")
            
        default: break
            
        }
        
    }

    
}
