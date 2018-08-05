//
//  Auth.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/17/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import Foundation
import Alamofire


let Auth = _Auth()

class _Auth{
    
    //Sign in
    func login(email:String, password:String) {
        let paramaters: [String: String] = [
            "username": email,
            "password": password,
            "client_id": Configs.client_id,
            "grant_type":"password",
            "client_secret": Configs.client_secret
        ]
        
        
        let loginUrl = Configs.oauthURL
        let headers = ["Content-Type" :"application/x-www-form-urlencoded"]
        
        Alamofire.request(loginUrl, method: .post,
                          parameters: paramaters,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON { (response) in
                
                //print("res:: " +  String(data: response.data!, encoding:String.Encoding.utf8)!)
                //test success 200 OK
                let dic = response.result.value as!  [String:AnyObject]
                
                for dicItem in dic{
                    //                    print(dicItem)
                    UserDefaults.standard.set( dicItem.value, forKey:dicItem.key )
                }

                if let accessToken = UserDefaults.standard.value(forKey: "access_token"){
                    print("accesssssssss token=============")
                    print(accessToken)
                }
            }
        }
    
    // Sign up
    func register(email:String, password:String,password_confirmation:String ) {
        print("register.2")
        
        
        let parameters: [String: String] = [
            //"name":userName,
            "email":email,
            "password":password,
            "password_confirmation":password_confirmation
            
        ]
        
        let headers = ["accept" :"application/json"]
        
        let usersUrl = Configs.rootURL+"/users"
        
        
        Alamofire.request(usersUrl, method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseData { (response) in
                
                
                //            print("res:: " +  String(data: response.data!, encoding: String.Encoding.utf8)!)
                print("Success: \(response.result.isSuccess)")
                
                
                if let alamoError = response.result.error {
                    let alamoCode = alamoError._code
                    let statusCode = (response.response?.statusCode)!
                    
                } else { //no errors
                    let statusCode = (response.response?.statusCode)! //example : 200
                    print(statusCode)
                    }
                }
        }
    
    // Forgot password
    func forgotPassword(email: String){
        let parameters : [String :String] = [
            "email" : email
        ]
        let headers = ["accept" :"application/json"]
        let forgotPasswordUrl = Configs.rootURL+"/users/forgotPassword/"
        
        Alamofire.request(forgotPasswordUrl, method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseData { (response) in
                
                print(response)
                
                if let alamoError = response.result.error {
                    let alamoCode = alamoError._code
                    let statusCode = (response.response?.statusCode)!
                    
                } else { //no errors
                    let statusCode = (response.response?.statusCode)! //example : 200
                    print(statusCode)
                    
                }
                
        }
        
    }
}

