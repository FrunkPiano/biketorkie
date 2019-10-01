//
//  BlockedAccountViewController.swift
//  biketorkie
//
//  Created by Millow on 2019/9/30.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class BlockedAccountViewController: UIViewController, BlockedAccountDelegate {
    var people = ["man1", "man2", "man3"]
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 100), style: .grouped)
                tableView.backgroundColor = UIColor.white
                self.view.addSubview(tableView)
                tableView.snp.makeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
                tableView.delegate = self
                tableView.dataSource = self
                tableView.register(UINib(nibName: "BlockAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "BlockAccountTableViewCell")
    }
    

    func unblockAccount(index: Int) {
        people.remove(at: index)
        tableView.reloadData()
    }

}

extension BlockedAccountViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "BlockAccountTableViewCell", for: indexPath) as? BlockAccountTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = people[indexPath.row]
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
