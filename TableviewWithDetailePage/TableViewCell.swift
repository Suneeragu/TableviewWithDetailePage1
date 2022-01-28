//
//  TableViewCell.swift
//  TableviewWithDetailePage
//
//  Created by Suneetha Ragupatula on 1/25/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mainNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
