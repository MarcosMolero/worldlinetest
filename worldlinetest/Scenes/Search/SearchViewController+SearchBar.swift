//
//  SearchViewController+SearchBar.swift
//  worldlinetest
//
//  Created by Marcos Molero on 08/11/2018.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filterPointsOI = displayPointsOI.filter({ (displayPointoI) -> Bool in
            return displayPointoI.title.lowercased().contains(searchText.lowercased())
        })
        searchTableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && searchController.searchBar.text! != ""
    }
}
