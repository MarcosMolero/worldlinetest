//
//  SwinjectViewControllerDependencyInjector.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit
import Swinject

extension String {
    var localized:String {
        return NSLocalizedString(self, comment: "")
    }
}

class SwinjectViewControllerDependencyInjector<T: UIViewController>: SceneDependencyInjector<T>, Assembly {
    lazy var DIManager:SwinjectDIManager = DIBuilder.shared.build()
    
    override init() {
        super.init()
        DIManager.assembler.apply(assembly: self)
    }
    
    func assemble(container: Container) {
        type(of:self).registerDependencies(container:container)
    }
    
    class func registerDependencies(container:Container) {}
    
    override func inject(to viewController: T) {
        let resolver = DIManager.assembler.resolver
        _ = resolver.resolve(T.self, argument:viewController)
    }
}
