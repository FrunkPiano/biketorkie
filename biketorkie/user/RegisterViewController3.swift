//
//  RegisterViewController3.swift
//  biketorkie
//
//  Created by jie on 2019/8/20.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
class RegisterViewController3: UIViewController {
    
    
    
  
    @IBOutlet weak var biographyField: UITextField!
    @IBOutlet weak var experienceField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SignUpShare.shared )
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        SignUpShare.shared.biography=biographyField.text
        SignUpShare.shared.experience=experienceField.text
//        SignUpShare.shared.address=addressField.text
    }
    
}
