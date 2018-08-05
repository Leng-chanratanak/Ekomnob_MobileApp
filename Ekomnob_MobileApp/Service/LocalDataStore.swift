//
//  LocalDataStore.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/18/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import Foundation
let LocalDataStore = _LocalDataStore()
class _LocalDataStore: NSObject {
    var ready = false
    var contentTypeArray :  ContentTypeModel!
    var isready = false
    var contentPostArray :  ContentPostModel!
    
    
}
