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
        container.register(PointOIStore.self) { container in
            let pointOIAPIStore = PointOIAPIStore()
            return pointOIAPIStore
        }
    }
    
}
