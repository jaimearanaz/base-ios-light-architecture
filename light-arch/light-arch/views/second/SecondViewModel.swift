//
//  SecondViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

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
        
        loading.value = true
        
        let oneCancellable =
            networkRepository.getSomeData { result in

                self.loading.value = false
                
                switch result {

                case .success(let foo):
                    self.foo.value = foo
                    self.result.value = .success(Void())
                
                case .failure(let error):
                    self.result.value = .failure(error)
                }
            }
        
        cancellables.append(oneCancellable)
    }
}
