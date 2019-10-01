//
//  ForgetPasswordViewController.swift
//  biketorkie
//
//  Created by Millow on 2019/10/1.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func nextStep(_ sender: Any) {
        CSToast.show("change password success", duration: 2.0)
    }
    

}
