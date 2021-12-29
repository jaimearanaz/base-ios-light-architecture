//
//  SecondViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

enum SecondOperation: OperationId {
    case foo = 1000
}

enum SecondError: Error {
    case notFound(OperationId)
}

protocol SecondViewModelOutput: BaseViewModelOutput {
    
    var foo: Box<Foo> { get set }
}

protocol SecondViewModelInput: BaseViewModelInput {
    
    func fooMethod()
}

protocol SecondViewModel: BaseViewModel, SecondViewModelOutput, SecondViewModelInput {
    
    var networkRepository: NetworkRepositoryProtocol { get set }
}

class DefaultSecondViewModel: BaseViewModel, SecondViewModel {
    
    var networkRepository: NetworkRepositoryProtocol
    var foo = Box(Foo(param1: "", param2: 0, param3: false))
    
    init(networkRepository: NetworkRepositoryProtocol, analytics: AnalyticsProtocol) {
        
        self.networkRepository = networkRepository
        super.init()
        self.analytics = analytics
    }

    func fooMethod() {
        
        let id = SecondOperation.foo.rawValue
        loading.value = (id, true)
        
        let oneCancellable =
            networkRepository.getSomeData { result in

                self.loading.value = (id, false)
                
                switch result {

                case .success(let foo):
                    self.foo.value = foo
                    self.result.value = .success(id)
                
                case .failure(let networkError):

                    var error: Error?
                    
                    switch networkError {
                    case NetworkError.noInternet:
                        error = BaseViewModelError.noInternet(id)
                    default:
                        error = BaseViewModelError.unknown(id)
                    }
                    
                    self.result.value = .failure(error!)
                }
            }
        
        cancellables.append(oneCancellable)
    }
}
