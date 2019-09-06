//
//  RegisterViewController1.swift
//  biketorkie
//
//  Created by jie on 2019/8/20.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
class RegisterViewController1: UIViewController {
 
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
//    let shared=SignUpShare.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! RegisterViewController2
//        self.shared.firstName=firstNameField.text
//        self.shared.lastName=lastNameField.text
//        self.shared.email=emailField.text
//        self.shared.password=passwordField.text
        SignUpShare.shared.firstName=firstNameField.text
        SignUpShare.shared.lastName=lastNameField.text
        SignUpShare.shared.email=emailField.text
        SignUpShare.shared.password=passwordField.text
//        vc.shared=self.shared
    }
    
}
