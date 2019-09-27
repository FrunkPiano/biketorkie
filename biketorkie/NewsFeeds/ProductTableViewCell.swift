//
//  ProductTableViewCell.swift
//  biketorkie
//
//  Created by wangweiwei on 9/27/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    var buyClosure: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buyRightnow(_ sender: Any) {
        if let closure = buyClosure {
            closure()
        }
        
    }
}
