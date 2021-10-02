//
//  weekTableViewCell.swift
//  food-management
//
//  Created by 준수김 on 2021/09/30.
//

import UIKit

class weekTableViewCell: UITableViewCell {

    @IBOutlet weak var dayTitle: UILabel!
    @IBOutlet weak var reminderCalorie: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
