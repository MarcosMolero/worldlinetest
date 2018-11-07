//
//  CustomCell.swift
//  worldlinetest
//
//  Created by Marcos Molero on 07/11/2018.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
