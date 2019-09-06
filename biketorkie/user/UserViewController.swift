//
//  UserViewController.swift
//  biketorkie
//
//  Created by jie on 2019/8/19.
//  Copyright © 2019 jie. All rights reserved.
//

import Foundation
import UIKit
import SQLite
class UserViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginClick(_ sender: Any) {
        print("login")
        
        
        
    }
    @IBAction func forgetPasswd(_ sender: Any) {
        print("forgetPasswd")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userEmail = username.text;
        let userPassword = password.text;
        var realPasswd=""
        do{
//            let path = NSSearchPathForDirectoriesInDomains(
//                .documentDirectory, .userDomainMask, true
//                ).first!
//            
//            let db = try Connection("\(path)/db.sqlite3")
//            let users = Table("users")
//            let email = Expression<String>("email")
//            let password=Expression<String>("password")
//            let alice = users.filter(email == userEmail ?? "")
//            realPasswd = alice[password] as! String
            print(realPasswd)
        }catch{
            
        }
        if segue.identifier == "loginSegue"  {
           
            // do some init if you want
        }
    }
    
}
