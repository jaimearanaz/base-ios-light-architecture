//
//  BaseViewController.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol {
    
    var analytics: AnalyticsProtocol? { get set }
    
    func localization()
    func customization()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
        
    var baseViewModel: BaseViewModel?
    var analytics: AnalyticsProtocol?
    var injector: DependencyInjectorProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        localization()
        customization()
        assertViewModel()
        binds()
        baseViewModel?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        assertViewModel()
        baseViewModel?.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        baseViewModel?.viewWillDisappear()
    }
    
    func localization() {
        
    }
    
    func customization() {
         
    }
    
    func binds() {

    }
    
    private func assertViewModel() {
        
        assert(baseViewModel != nil, "base view model must be set in base view controller")
        assert(injector != nil, "injector must be set in base view controller")
    }
}
