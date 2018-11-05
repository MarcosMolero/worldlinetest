//
//  SwinjectDIManager.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import Swinject

protocol SwinjectDIManager: DependencyInjectionManager {
    var assembler:Assembler! {get}
}
