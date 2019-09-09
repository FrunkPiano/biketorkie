//
//  ProfileViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/9/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var bikeType: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var medal: UIImageView!
    @IBOutlet weak var introdution: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func EditProfile(_ sender: Any) {
    }
    
    @IBAction func Settings(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
