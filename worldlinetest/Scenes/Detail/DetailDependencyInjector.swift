//
//  DetailDependencyInjector.swift
//  worldlinetest
//
//  Created by Marcos Molero on 07/11/2018.
//  Copyright (c) 2018 Marcos Molero. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit
import Swinject

// MARK: Inject all scene dependencies

class DetailDependencyInjector: SwinjectViewControllerDependencyInjector<DetailViewController> {
    
    // MARK: Registration
    
    override class func registerDependencies(container: Container) {
        container.register(DetailViewController.self) { (resolver, viewController:DetailViewController) -> DetailViewController in
            let interactor = resolver.resolve(DetailInteractor.self)!
            let presenter = DetailPresenter()
            let router = DetailRouter()
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