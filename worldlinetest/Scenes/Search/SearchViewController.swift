//
//  SearchViewController.swift
//  worldlinetest
//
//  Created by Marcos Molero on 07/11/2018.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol SearchDisplayLogic: class {
    func displayPointsOI(viewModel: SearchScene.GetPointsOIFromDB.ViewModel)

}

class SearchViewController: UIViewController, SearchDisplayLogic {
    
    var interactor: SearchBusinessLogic?
    var router: (SearchRoutingLogic & SearchDataPassing)?
    var dependencyInjector:SceneDependencyInjector! = SearchDependencyInjector()
    
    // MARK: Object lifecycle
    @IBOutlet weak var searchTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var displayPointsOI: [SearchScene.GetPointsOIFromDB.DisplayPointOI] = []
    var filterPointsOI: [SearchScene.GetPointsOIFromDB.DisplayPointOI] = []

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        dependencyInjector.inject(to:self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        getPointsOIFromDB()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: Requests
    func getPointsOIFromDB() {
        let request = SearchScene.GetPointsOIFromDB.Request()
        interactor?.getPointsOIFromDB(request: request)
    }
    
    // MARK: Display logic
    func displayPointsOI(viewModel: SearchScene.GetPointsOIFromDB.ViewModel) {
        self.displayPointsOI = viewModel.displayPointsOI
        
    }
}

extension SearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}