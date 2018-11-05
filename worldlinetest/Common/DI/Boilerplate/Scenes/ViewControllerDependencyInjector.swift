//
//  ViewControllerDependencyInjector.swift
//  CleanArchitecture
//
//  Created by Marcos Molero on 23/6/18.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerDependencyInjector:class {
    associatedtype ViewController:UIViewController
    func inject(to viewController:ViewController)
}
