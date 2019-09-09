//
//  ProfileTableViewCell.swift
//  biketorkie
//
//  Created by wangweiwei on 9/9/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var activityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var dynamic: Dynamic? {
        didSet {
            activityLabel.text = dynamic?.activity
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
