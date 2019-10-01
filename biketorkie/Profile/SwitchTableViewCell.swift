//
//  SwitchTableViewCell.swift
//  biketorkie
//
//  Created by Millow on 2019/10/1.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    var name = "" {
        didSet {
            titleLabel.text = name
        }
    }
    @IBOutlet weak var switchPanel: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
