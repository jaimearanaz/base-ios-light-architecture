//
//  Array+Extension.swift
//  clean-arch
//
//  Created by Jaime Aranaz on 23/12/2021.
//

import Foundation

extension Array where Element: AnyObject {
    mutating func removeFirst(object: AnyObject) {
        guard let index = firstIndex(where: {$0 === object}) else { return }
        remove(at: index)
    }
}
