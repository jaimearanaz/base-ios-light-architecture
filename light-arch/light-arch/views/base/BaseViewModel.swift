//
//  BaseViewModel.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

protocol BaseViewModelOutput {

    var loading: Box<Bool> { get set }
    var result: Box<Result<Void, Error>> { get set }
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
    var loading = Box(false)
    var result: Box<Result<Void, Error>> = Box(.success(Void()))
    
    func viewDidLoad() {
        // Override in subclass
    }
    
    func viewDidAppear() {
        // Override in subclass
    }
    
    func viewWillDisappear() {
        cancellables.forEach { $0.cancel() }
    }
}
