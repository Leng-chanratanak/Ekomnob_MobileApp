//
//  SignInViewController.swift
//  Ekomnob_MobileApp
//
//  Created by Leng-chanratanak on 6/9/18.
//  Copyright © 2018 Leng-chanratanak. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FacebookLogin
import GoogleSignIn

class SignInViewController: UIViewController,  GIDSignInDelegate, GIDSignInUIDelegate{
   
    
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(screenWidth)
        print(screenHeight)

        
        self.hideKeyboardWhenTappedAround()
    }
    @IBAction func SignIn(_ sender: Any) {
        print("sign in")
        Auth.login(email: emailTextField.text!, password:passwordTextField.text! )
    }
    
    
    @IBAction func SignInWithFacebook(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ .publicProfile, .email], viewController: self) { LoginResult in
            switch LoginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
                print(accessToken.authenticationToken)
            }
        }
     
    }

    @IBAction func SignInWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().uiDelegate=self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                    
                }
            })
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print(userId! + idToken!)
            // ...
        } else {
            print(error.localizedDescription)
        }
    }
//    func signIn(inWillDispatch signIn: GIDSignIn!, error: Error!) {
//        
//    }
//    
//    func signIn(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
//        
//    }
//    func signIn(_ signIn: GIDSignIn!,
//                dismiss viewController: UIViewController!) {
//        self.dismiss(animated: true, completion: nil)
//    }
    func signIn(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                withError error: Error!) {
        
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
