//
//  DetailViewController+TableView.swift
//  worldlinetest
//
//  Created by Marcos Molero on 07/11/2018.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell {
            let row = indexPath.row
            
            if row == 0 {
                if let address = displayPointOI?.address {
                    cell.setup(title: "Address", description: address)
                }
            } else if row == 1 {
                if let transport = displayPointOI?.transport {
                    cell.setup(title: "Transport", description: transport)
                }
            } else if row == 2 {
                if let email = displayPointOI?.email {
                    cell.setup(title: "Email", description: email)
                }
            } else if row == 3 {
                if let description = displayPointOI?.description {
                    cell.setup(title: "Description", description: description)
                }
            } else if row == 4 {
                if let phone = displayPointOI?.phone {
                    cell.setup(title: "Phone", description: phone)
                }
            }

            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
