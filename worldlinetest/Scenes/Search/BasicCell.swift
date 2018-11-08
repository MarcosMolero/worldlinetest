//
//  BasicCell.swift
//  worldlinetest
//
//  Created by Marcos Molero on 08/11/2018.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(title: String) {
        titleLabel.text = title
    }

}
