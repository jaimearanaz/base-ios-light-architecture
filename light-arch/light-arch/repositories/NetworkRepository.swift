//
//  NetworkRepository.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation
import SwiftyTimer

class NetworkRepository: NetworkRepositoryProtocol, Cancellable {

    typealias Request = AnyObject
    var requests = [Request]()

    func cancel() {
        
        requests.forEach { oneRequest in
            // cancel here the networking request
        }
    }
    
    func getSomeData(completion: @escaping (Result<Foo, Error>) -> Void) -> Cancellable {
        
        Timer.after(2) {
            let data = Foo(param1: "This is coming from data layer!", param2: 0, param3: true)
            //completion(.success(data))
            //completion(.failure(NetworkError.noInternet))
            completion(.failure(NetworkError.notFound))
            self.requests.removeFirst(object: self)
        }
        
        requests.append(self)
        return self
    }
    
    func sendSomeData(data: Foo, completion: @escaping (Result<Void, Error>) -> Void) -> Cancellable {
        
        Timer.after(2) {
            completion(.success(Void()))
            self.requests.removeFirst(object: self)
        }
        
        requests.append(self)
        return self
    }
}
