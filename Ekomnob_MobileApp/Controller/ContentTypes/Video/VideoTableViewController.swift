//
//  VideoTableViewController.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/13/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class VideoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ContentPosts.contentPosts(){ ()in
            self.tableView.reloadData()
        }
        self.tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "VIDEOCELL")
        
        print("1")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VIDEOCELL", for: indexPath) as! VideoTableViewCell
        //cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if(LocalDataStore.isready)
        {
            print("2")
            print(LocalDataStore.contentPostArray.data)
            let data = LocalDataStore.contentPostArray.data[indexPath.row]
            

//            let img = data.thumbnail_url
//            Alamofire.request(img).responseImage { response in
//                if let image = response.result.value {
//                    cell.videoImageView.image = image
//
//                }
//            }
            
            print("Title")
            print(data.title)
            //cell.titleVideoLabel.text = "data"

        }
        
        return cell
    }
    
}
