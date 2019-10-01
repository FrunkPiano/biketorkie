//
//  SoundControlViewController.swift
//  biketorkie
//
//  Created by Millow on 2019/9/30.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class SoundControlViewController: UIViewController {

    var tableView = UITableView()
    var vibrates = ["Vibrate on ring", "Vibrate on silent"]
    var partterns = ["Newsfeed post", "Notification", "Friends request", "Event reminder"]
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
        tableView.register(UINib(nibName: "SwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "SwitchTableViewCell")
        tableView.register(UINib(nibName: "SoundSlideTableViewCell", bundle: nil), forCellReuseIdentifier: "SoundSlideTableViewCell")
        
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

extension SoundControlViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainWidth, height: 100))
            label.text = "VIBRATE"
            return label
        } else if section == 1 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainWidth, height: 100))
            label.text = "RINGER AND ALERTS"
            return label
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainWidth, height: 100))
            label.text = "SOUND AND VIBRATE PATTERNS"
            return label
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return vibrates.count
        }else if section == 1 {
            return 1
        }else {
            return partterns.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchTableViewCell")  as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.name = vibrates[indexPath.row]
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SoundSlideTableViewCell")
            return cell!
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchTableViewCell")  as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.name = partterns[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
