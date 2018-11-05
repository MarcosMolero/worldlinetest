//
//  ProductionDI.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Swinject

final class ProductionDI: SwinjectDIManager {
    
    var assembler: Assembler!
    
    func registerDependencies() {
        assembler = Assembler([NetworkAssembly(),BusinessAssembly()])
    }
}
