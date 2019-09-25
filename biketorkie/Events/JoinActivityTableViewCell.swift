//
//  JoinActivityTableViewCell.swift
//  biketorkie
//
//  Created by wangweiwei on 9/19/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class JoinActivityTableViewCell: UITableViewCell {
    var advanture: Advanture?
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = UIColor(white: 1, alpha: 0.7)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func joinActivity(_ sender: Any) {
        CSToast.show("join success!", duration: 1.0)
    }
    
    @IBAction func likeActivity(_ sender: Any) {
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
    }
    @IBAction func shareActivity(_ sender: Any) {
        CSToast.show("share success!", duration: 1.0)
    }
}
