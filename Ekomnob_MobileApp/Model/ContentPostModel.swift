//
//  ContentModel.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/18/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import Foundation

struct ContentPostModel: Decodable {
    
    let success : Bool
    let data    : [Data]
    let message : String
    
    struct Data : Decodable {
        
        let id      : Int
        let title   : String
        let short_description   : String
        let long_description    : String
        //let thumbnail_url       : String
        //let content_url         : String
        //let video_url           : String
        let revision        : Int
        let publish_at      : String
        let totalLikes      : Int
        let totalComments   : Int
       // let uploader :  [Uploader]

//        struct Uploader : Decodable {
//
//            //let id_uploader  : Int
//            let firstname   : String
//            let lastname    : String
////            let thumbnail_url_uploader   : String
////            let avatar_url      : String
//
//        }
        
    }
    enum codeKey: String, CodingKey{
        
        case id         = "id"
        case title      = "title"
        case short_description  =   "short_description"
        case long_description   =   "long_description"
        //case thumbnail_url  =   "thumbnail_url"
        //case content_url    =   "content_url"
        //case video_url      =   "video_url"
        case revision       =   "revision"
        case publish_at     =   "publish_at"
        case totalLikes     =   "totalLikes"
        case totalComments  =   "totalComments"
       
//        case uploader   =   "uploader"
//        //case id_uploader         = "id"
//        case firstname  =   "firstname"
//        case lastname   =   "lastname"
////        case thumbnail_url_uploader =   "thumbnail_url_uploader"
////        case avatar_url =   "avatar_url"
        
        case success    = "success"
        case data       = "data"
        case message    = "message"
        
    }
}
