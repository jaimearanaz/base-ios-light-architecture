//
//  BaseViewModel.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

protocol BaseViewModelOutput {

}

protocol BaseViewModelInput {
    
    func viewDidLoad()
    func viewDidAppear()
    func viewWillDisappear()
}

protocol BaseViewModelProtocol: BaseViewModelOutput, BaseViewModelInput {
 
    var analytics: AnalyticsProtocol? { get set }
    var cancellables: [Cancellable] { get set }
}

class BaseViewModel: BaseViewModelProtocol {
    
    var analytics: AnalyticsProtocol?
    var cancellables = [Cancellable]()
    
    func viewDidLoad() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() {
        cancellables.forEach { $0.cancel() }
    }
}
