//
//  BaseViewModel.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

typealias OperationId = Int
typealias Loading = (operationId: OperationId, isLoading: Bool)

enum BaseViewModelOperation: OperationId {
    case anyone = 0
}

enum BaseViewModelError: Error {
    
    case unknown(OperationId)
    case noInternet(OperationId)
}

protocol BaseViewModelOutput {

    var loading: Box<Loading> { get set }
    var result: Box<Result<OperationId, Error>> { get set }
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
    var loading: Box<Loading> = Box((operationId: 0, isLoading: false))
    var result: Box<Result<OperationId, Error>> = Box(.success(0))
    
    func viewDidLoad() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() {
        cancellables.forEach { $0.cancel() }
    }
}
