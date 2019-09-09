//
//  ProfileViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/9/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
import SnapKit
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var bikeType: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var medal: UIImageView!
    @IBOutlet weak var introdution: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 100), style: .grouped)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(introdution).offset(200)
            make.left.right.bottom.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        
    }
    
    @IBAction func EditProfile(_ sender: Any) {
    }
    
    @IBAction func Settings(_ sender: Any) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
