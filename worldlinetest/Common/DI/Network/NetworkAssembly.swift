//
//  NetworkAssembly.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Swinject

class NetworkAssembly: Assembly {
    var container:Container!
    
    func assemble(container: Container) {
        self.container = container
        registerStores()
    }
    
    func registerStores() {
        registerPointOIStore()
    }
    
    func registerPointOIStore() {
        container.register([PointOIStore].self) { container in
            let apiStore = container.resolve(PointOIStore.self, name: "api")!
            let realmStore = container.resolve(PointOIStore.self, name: "realm")!
            
            return [apiStore, realmStore]
        }
        
        container.register(PointOIStore.self, name: "api") { container in
            let store = PointOIAPIStore()
            return store
        }
        
        container.register(PointOIStore.self, name: "realm") { container in
            let store = PointOIRealmStore()
            return store
        }
    }
    
}
