//
//  ProfileHeaderView.swift
//  biketorkie
//
//  Created by wangweiwei on 9/9/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
protocol PofileHeaderDelegate {
    func editProfile(user: AppUser) -> AppUser
}

class ProfileHeaderView: UIView {
    var delegate: PofileHeaderDelegate?
    var editBlock: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func editProfile(_ sender: Any) {
        guard let block = editBlock else {
            return
        }
        block()
    }
    
}
