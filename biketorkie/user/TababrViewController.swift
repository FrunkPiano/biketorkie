//
//  TababrViewController.swift
//  biketorkie
//
//  Created by Millow on 2019/9/30.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class TababrViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let NotifyChatMsgRecv = NSNotification.Name(rawValue:"logout")
        //接受通知监听
        NotificationCenter.default.addObserver(self, selector:#selector(didMsgRecv(notification:)),
         name: NotifyChatMsgRecv, object: nil)  
        
       
    }
    
    //通知处理函数
    @objc func didMsgRecv(notification:NSNotification){
          self.dismiss(animated: true, completion: nil)
    }

    

}
