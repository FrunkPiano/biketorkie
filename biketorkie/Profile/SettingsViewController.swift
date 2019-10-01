//
//  SettingsViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/27/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var tableView: UITableView!
    var items = ["Rest Password", "Invite Friends", "Blocked Accounts", "Sound", "Notifications", "Help", "About", "Language"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
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
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return items.count
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "SettingsCell")
        }
        if indexPath.section == 0 {
            cell?.textLabel?.text = items[indexPath.row]
        } else {
            cell?.textLabel?.text = "Logout"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
//                let resetVC = WWWebViewController(url: "www.facebook.com")
                let resetVC = ForgetPasswordViewController()
                self.navigationController?.pushViewController(resetVC, animated: true)
            } else if indexPath.row == 2 {
                let blockedVC = BlockedAccountViewController()
                self.navigationController?.pushViewController(blockedVC, animated: true)
            } else if indexPath.row == 3 {
                let soundVC = SoundControlViewController()
                self.navigationController?.pushViewController(soundVC, animated: true)
            } else if indexPath.row == 6 {
                let aboutVC = AboutViewController()
                self.navigationController?.pushViewController(aboutVC, animated: true)
            }
        }else {
            //通知名称常量
            let NotifyChatMsgRecv = NSNotification.Name(rawValue:"logout")
            //发送通知
            NotificationCenter.default.post(name:NotifyChatMsgRecv, object: nil, userInfo: nil)
            
        }
        
    }
}
