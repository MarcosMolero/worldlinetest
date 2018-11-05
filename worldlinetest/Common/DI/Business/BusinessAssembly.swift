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
    }
    
    private func registerLandingInteractor() {
        container.register(LandingInteractor.self) { container in
//            let authenticationStoreWorker = container.resolve(AuthenticationStoreWorker.self)!
            let interactor = LandingInteractor()
//            interactor.authenticationStoreWorker = authenticationStoreWorker
            
            return interactor
        }
    }
    
    // ============================ WORKERS ============================
    private func registerWorkers() {
        registerCustomStoreWorker()
    }
    
    private func registerCustomStoreWorker() {
//        container.register(NewsStoreWorker.self) { container in
//            let store = container.resolve(NewsStore.self)!
//            let newsStoreWorker = NewsStoreWorker(store: store)
//
//            return newsStoreWorker
//        }
    }
}
