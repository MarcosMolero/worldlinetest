//
//  MainDependencyInjector.swift
//  worldlinetest
//
//  Created by Marcos Molero on 05/11/2018.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates

import UIKit
import Swinject

// MARK: Inject all scene dependencies

class MainDependencyInjector: SwinjectViewControllerDependencyInjector<MainViewController> {
    
    // MARK: Registration
    
    override class func registerDependencies(container: Container) {
        container.register(MainViewController.self) { (resolver, viewController:MainViewController) -> MainViewController in
            let interactor = resolver.resolve(MainInteractor.self)!
            let presenter = MainPresenter()
            let router = MainRouter()
            viewController.interactor = interactor
            viewController.router = router
            interactor.presenter = presenter
            presenter.viewController = viewController
            router.viewController = viewController
            router.dataStore = interactor
            return viewController
        }
    }
}
