//
//  TableViewCell.swift
//  Sample
//
//  Created by Huy on 12/3/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
