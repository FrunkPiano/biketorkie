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
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
    
    @IBAction func loginClick(_ sender: Any) {
//        HttpRequest.loadData(target: DMAPI.login(account: "11111", password: "123456"), success: { (data) in
//            print("登录成功")
//        }) { (code, msg) in
//            print("登录失败")
//        }
        
        
//        NetworkTools.POST(url: "http://10.2.129.63:8080/user/loginbypwd.do", params: ["phone": "1111", "password": "123456"], success: { (json) in
//            print("登录成功")
//        }) { (state_code, message) in
//            print(state_code)
//            print(message)
//            print("登录失败")
//        }
        
    }
    @IBAction func forgetPasswd(_ sender: Any) {
        let forgetVC = ForgetPasswordViewController()
        self.present(forgetVC, animated: true, completion: nil)
//        print("forgetPasswd")
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
