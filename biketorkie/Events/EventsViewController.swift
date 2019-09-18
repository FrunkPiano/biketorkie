//
//  EventsViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/18/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet weak var switcher: DynamicMaskSegmentSwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let configure = DynamicMaskSegmentSwitchConfigure(highlightedColor: UIColor.orange, normalColor: UIColor.white, items: ["首页","消息","发现","个人"])
        
        switcher.configure = configure

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
