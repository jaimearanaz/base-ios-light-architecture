//
//  WelcomeViewModel.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

protocol WelcomeViewModelOutput: BaseViewModelOutput {
    
    var foo: Box<Foo> { get set }
}

protocol WelcomeViewModelInput: BaseViewModelInput {
    
    func fooMethod()
}

protocol WelcomeViewModel: BaseViewModel, WelcomeViewModelOutput, WelcomeViewModelInput {
    
    var networkRepository: NetworkRepositoryProtocol { get set }
}

class DefaultWelcomeViewModel: BaseViewModel, WelcomeViewModel {
    
    var networkRepository: NetworkRepositoryProtocol
    var foo = Box(Foo(param1: "", param2: 0, param3: false))
    
    init(networkRepository: NetworkRepositoryProtocol, analytics: AnalyticsProtocol) {
        
        self.networkRepository = networkRepository
        super.init()
        self.analytics = analytics
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        analytics?.logBackgroundWithLastScreen()
    }
    
    override func viewDidAppear() {
        
        super.viewDidAppear()
        analytics?.logBackgroundWithLastScreen()
    }
    
    func fooMethod() {
        
        let oneCancellable =
            networkRepository.getSomeData { result in
                
                switch result {
                
                case .success(let foo):
                    self.foo.value = foo
                
                case .failure(let error):
                    print(error)
                }
            }
        cancellables.append(oneCancellable)
    }
}
