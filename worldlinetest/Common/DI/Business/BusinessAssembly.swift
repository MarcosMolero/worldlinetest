//
//  BusinessAssembly.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Swinject

class BusinessAssembly: Assembly {
    var container:Container!
    
    func assemble(container: Container) {
        self.container = container
        registerWorkers()
        registerInteractors()
    }
    // ============================ INTERACTORS ============================
    private func registerInteractors() {
        registerLandingInteractor()
        registerMainInteractor()
    }
    
    private func registerLandingInteractor() {
        container.register(LandingInteractor.self) { container in
            let interactor = LandingInteractor()
            return interactor
        }
    }
    
    private func registerMainInteractor() {
        container.register(MainInteractor.self) { container in
            let pointOIStoreWorker = container.resolve(PointOIStoreWorker.self)!
            let interactor = MainInteractor()
            interactor.pointOIStoreWorker = pointOIStoreWorker
            return interactor
        }
    }
    
    // ============================ WORKERS ============================
    private func registerWorkers() {
        registerPointOIStoreWorker()
    }
    
    private func registerPointOIStoreWorker() {
        container.register(PointOIStoreWorker.self) { container in
            let store = container.resolve(PointOIStore.self)!
            let pointOIStoreWorker = PointOIStoreWorker(store: store)
            return pointOIStoreWorker
        }
    }
}
