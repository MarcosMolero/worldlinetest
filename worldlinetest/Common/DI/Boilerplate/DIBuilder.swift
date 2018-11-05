//
//  DIBuilder.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation

final class DIBuilder {
    
    static let shared = DIBuilder()
    
    private init() { }
    
    private lazy var manager:SwinjectDIManager = {
        ProductionDI()
    }()
    
    func build() -> SwinjectDIManager {
        return manager
    }
}
