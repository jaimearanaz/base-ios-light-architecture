//
//  NetworkRepositoryProtocol.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

protocol NetworkRepositoryProtocol {
    
    @discardableResult
    func getSomeData(completion: @escaping (Result<Foo, Error>) -> Void) -> Cancellable;
    
    @discardableResult
    func sendSomeData(data: Foo, completion: @escaping (Result<Void, Error>) -> Void) -> Cancellable;
}
