//
//  RegisterViewController4.swift
//  biketorkie
//
//  Created by jie on 2019/8/20.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
import SQLite
class RegisterViewController4: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SignUpShare.shared )
        do{
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        let db = try Connection("\(path)/db.sqlite3")
        
        let users = Table("users")
        let id = Expression<Int64>("id")
        let firstName = Expression<String?>("firstName")
        let lastName = Expression<String?>("lastName")
        let gender = Expression<String?>("gender")
        let birthday = Expression<String?>("birthday")
        let address = Expression<String?>("address")
        let experience = Expression<String?>("experience")
        let biography = Expression<String?>("biography")
        let photo = Expression<String?>("photo")
        let email = Expression<String>("email")
        let password=Expression<String>("password")
        let insert = users.insert(firstName <- SignUpShare.shared.firstName,lastName <- SignUpShare.shared.lastName,
                                  gender <- SignUpShare.shared.gender,
                                  birthday <- SignUpShare.shared.birthday,
                                  address <- SignUpShare.shared.address,
                                  experience <- SignUpShare.shared.experience,
                                  biography <- SignUpShare.shared.biography,
                                  photo <- SignUpShare.shared.photo,
                                  email <- SignUpShare.shared.email!,
                                  password <- SignUpShare.shared.password!)
        let rowid = try db.run(insert)
        }
                    catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
                        print("constraint failed: \(message), in \(statement)")
                    } catch let error {
                        print("insertion failed: \(error)")
                    }
        catch{
            
        }
    
    }
    @IBAction func signUp(_ sender: Any) {
        print(SignUpShare.shared)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //        SignUpShare.shared.address=addressField.text
    }
}
