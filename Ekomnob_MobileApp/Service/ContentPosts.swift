//
//  ContentPosts.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/18/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit
import Alamofire
import CodableAlamofire

let ContentPosts = _ContentPosts()

class _ContentPosts{
    
    func contentPosts( completion:@escaping () -> Void) {
        
        let contentUrl = Configs.rootURL + "/posts?content_type_id=1/"
        let headers = ["Content-Type" :"application/x-www-form-urlencoded"]
        
        Alamofire.request(contentUrl, method: .get,
                          parameters: nil,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON { (response) in
                
                let contentPostsResponse = response.data
                let jsonDecoder = JSONDecoder()
                LocalDataStore.contentPostArray = try! jsonDecoder.decode(ContentPostModel.self,from:contentPostsResponse! )
                LocalDataStore.isready = true
                //print(LocalDataStore.contentPostArray.data)
                completion()
        }
        
    }
    
}
