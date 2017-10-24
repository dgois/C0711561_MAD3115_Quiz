//
//  RankingTableViewCell.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    
    // MARK: Parameters
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblHighestScore: UILabel!
    @IBOutlet weak var lblLowestScore: UILabel!
    @IBOutlet weak var lblAttempts: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
