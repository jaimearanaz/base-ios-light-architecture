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
        assertViewModel()
        customization()
        localization()
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
        // Override in subclass
    }
    
    func customization() {
        // Override in subclass
    }
    
    func handleSuccess(operationId: OperationId) {
        // Override in subclass
    }
    
    func handleError(_ error: Error) {
        // Override in subclass
    }
    
    func startLoading(operationId: OperationId) {
        // Override in subclass
    }
    
    func stopLoading(operationId: OperationId) {
        // Override in subclass
    }
    
    func binds() {

        baseViewModel?.loading.bindAndFire({ loading in
            
            switch loading.isLoading {
            case true:
                self.startLoading(operationId: loading.operationId)
            case false:
                self.stopLoading(operationId: loading.operationId)
                break
            }
        })
        
        baseViewModel?.result.bind({ result in
            
            switch result {
            
            case .success(let operationId):
                self.handleSuccess(operationId: operationId)
            case .failure(let error):
                self.handleError(error)
            }
        })
    }
    
    private func assertViewModel() {
        
        assert(baseViewModel != nil, "base view model must be set in base view controller")
        assert(injector != nil, "injector must be set in base view controller")
    }
}
