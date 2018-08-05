//
//  ContentTypes.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/18/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit
import Alamofire
import CodableAlamofire

let ContentTypes = _ContentTypes()

class _ContentTypes{
    
    func contentType( completion:@escaping () -> Void) {
        
        let contentUrl = Configs.rootURL + "/contentTypes/"
        let headers = ["Content-Type" :"application/x-www-form-urlencoded"]
        
        Alamofire.request(contentUrl, method: .get,
                          parameters: nil,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON { (response) in
                
                let contentTypeResponse = response.data
                
                let jsonDecoder = JSONDecoder()
                LocalDataStore.contentTypeArray = try! jsonDecoder.decode(ContentTypeModel.self,from:contentTypeResponse! )
                
                LocalDataStore.ready = true
                completion()
        }
        
    }
    
}
