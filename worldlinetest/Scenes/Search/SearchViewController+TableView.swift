//
//  SearchViewController+TableView.swift
//  worldlinetest
//
//  Created by Marcos Molero on 08/11/2018.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filterPointsOI.count
        } else {
            return displayPointsOI.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: BasicCell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as? BasicCell {
            if isFiltering()  {
                cell.setup(title: filterPointsOI[indexPath.row].title)
                return cell
            } else {
                cell.setup(title: displayPointsOI[indexPath.row].title)
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Route to detail
    }
    
}
