//
//  LandingViewController.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates

import UIKit
import RealmSwift

protocol LandingDisplayLogic: class {
    
}

class LandingViewController: UIViewController, LandingDisplayLogic {
    
    var interactor: LandingBusinessLogic?
    var router: (LandingRoutingLogic & LandingDataPassing)?
    var dependencyInjector:SceneDependencyInjector! = LandingDependencyInjector()
    
    // MARK: Object lifecycle
    
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
    }
    
    // MARK: Requests
    
    
    // MARK: Display logic
    
}

extension LandingViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
