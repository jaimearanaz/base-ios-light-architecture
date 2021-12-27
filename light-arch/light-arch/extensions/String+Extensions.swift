//
//  String+Extensions.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation
import UIKit

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
