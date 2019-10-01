//
//  BlockAccountTableViewCell.swift
//  biketorkie
//
//  Created by Millow on 2019/9/30.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
protocol BlockedAccountDelegate {
    func unblockAccount(index: Int)
}
class BlockAccountTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var delegate: BlockedAccountDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func unlock(_ sender: Any) {
        delegate?.unblockAccount(index: self.tag)
    }
    
    @IBAction func report(_ sender: Any) {
    }
}
