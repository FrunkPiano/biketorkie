//
//  RegisterViewController1.swift
//  biketorkie
//
//  Created by jie on 2019/8/20.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
class RegisterViewController2: UIViewController {
    
    var appuser: AppUser!
    
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(SignUpShare.shared )
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        SignUpShare.shared.gender=genderField.text
        SignUpShare.shared.birthday=birthdayField.text
        SignUpShare.shared.address=addressField.text
    }
    
}
