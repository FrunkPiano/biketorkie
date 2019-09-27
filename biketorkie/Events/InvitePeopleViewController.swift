//
//  InvitePeopleViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/27/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class InvitePeopleViewController: UIViewController {
    var items = ["Kevin", "Alice", "Jack", "Any"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "invite", style: .plain, target: self, action: #selector(invitePeople))
        
        var tableView: UITableView!
        tableView = UITableView.init(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 100), style: .grouped)
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
    }
    
    @objc func invitePeople() {
        CSToast.show("Invite done!", duration: 1.0)
        self.navigationController?.popViewController(animated: true)
    }

}

extension InvitePeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "EditProfileCell")
        }
        cell?.textLabel?.text = items[indexPath.row]
        cell?.imageView?.image = UIImage(named: "QQ20190823-210824")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
