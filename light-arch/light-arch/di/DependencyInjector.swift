//
//  DependencyInjector.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation
import UIKit

class DependencyInjector: DependencyInjectorProtocol {

    func injectWelcome(viewController: WelcomeViewController) {
        
        let analytics = DefaultAnalytics()
        let networkRepository = NetworkRepository()
        let viewModel = DefaultWelcomeViewModel(networkRepository: networkRepository, analytics: analytics)
        viewModel.analytics = DefaultAnalytics()

        viewController.viewModel = viewModel
        viewController.analytics = DefaultAnalytics()
        viewController.injector = self
    }
    
    func injectSecond(withSegue segue: UIStoryboardSegue) {
        
    }
}
