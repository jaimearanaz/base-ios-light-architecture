//
//  DependencyInjectorProtocol.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation
import UIKit

protocol DependencyInjectorProtocol {

    func injectWelcome(viewController: WelcomeViewController)
    
    func injectSecond(withSegue segue: UIStoryboardSegue)
}
