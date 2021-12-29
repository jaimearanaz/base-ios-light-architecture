//
//  AppError.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

enum AppError: Error {
    
    case unknown
    case noInternet
    case notFound
    case timeout
}
