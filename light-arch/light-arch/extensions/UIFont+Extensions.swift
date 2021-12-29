//
//  UIFont+Extension.swift
//  clean-arch
//
//  Created by Jaime Aranaz on 28/12/2021.
//

import Foundation
import UIKit

extension UIFont {
    
    static func regular(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Regular", size: size)!
    }
    
    static func bold(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Bold", size: size)!
    }

    static func black(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Black", size: size)!
    }
}
