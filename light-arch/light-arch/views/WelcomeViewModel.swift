//
//  WelcomeViewModel.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

enum WelcomeOperation: OperationId {
    case foo = 1000
}

enum WelcomeError: Error {
    case notFound(OperationId)
}

enum WelcomeTransition {
    
    case toSecond
    case toThird
    case dismiss
}

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
        
        let id = WelcomeOperation.foo.rawValue
        loading.value = (id, true)
        
        let oneCancellable =
            networkRepository.getSomeData { result in

                self.loading.value = (id, false)
                
                switch result {

                case .success(let foo):
                    self.result.value = .success(id)
                    self.foo.value = foo
                
                case .failure(let networkError):
                    
                    var error: Error?
                    
                    switch networkError {
                    case NetworkError.noInternet:
                        error = BaseViewModelError.noInternet(id)
                    case NetworkError.notFound:
                        error = WelcomeError.notFound(id)
                    default:
                        error = BaseViewModelError.unknown(id)
                    }
                    
                    self.result.value = .failure(error!)
                    print(error!)
                }
            }
        cancellables.append(oneCancellable)
    }
}
