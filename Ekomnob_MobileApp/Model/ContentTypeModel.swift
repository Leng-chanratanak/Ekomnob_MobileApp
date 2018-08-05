//
//  ContentTypeModel.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/18/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import Foundation

struct ContentTypeModel: Decodable  {
    
    let success : Bool
    let data    : [Data]
    let message : String
    
    struct Data : Decodable {
        
        let image_url   : String
        let khmer_name  : String
        let english_name: String
        let id          : Int
        let revision    : Int
        
    }
    
    enum codeKey: String, CodingKey{
        
        case khmer_name = "khmer_name"
        case image_url = "image_url"
        case english_name   = "english_name"
        case id = "id"
        case revision = "revision"
        case success = "success"
        case data = "data"
        case message = "message"
        
    }
}
