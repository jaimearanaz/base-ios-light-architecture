//
//  UIColor+Extensions.swift
//  clean-arch
//
//  Created by Jaime Aranaz on 28/12/2021.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(hex: String) {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        
        if hex.hasPrefix("#") {
            
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    
                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255
                }
            }
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        
        let newRed = CGFloat(red) / 255
        let newGreen = CGFloat(green) / 255
        let newBlue = CGFloat(blue) / 255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
    }
}

extension UIColor {
    
    struct RGB {
        var red: Int
        var green: Int
        var blue: Int
    }
    
    struct ColorDefinition {
        var literal: UIColor     // #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        var hex: String
        var rgb: RGB
    }

    static var party: UIColor {
        get {
            return ColorDefinition(literal: #colorLiteral(red: 0.4745098039, green: 0.2588235294, blue: 0.9294117647, alpha: 1),
                                   hex: "#7942EDFF",
                                   rgb: RGB(red: 121, green: 66, blue: 237)).literal
        }
    }
    
    static var octopus: UIColor {
        get {
            return ColorDefinition(literal: #colorLiteral(red: 0.937254902, green: 0.2705882353, blue: 0.3764705882, alpha: 1.0),
                                   hex: "#EF4560FF",
                                   rgb: RGB(red: 239, green: 69, blue: 96)).literal
        }
    }
    
    static var pineapple: UIColor {
        get {
            return ColorDefinition(literal: #colorLiteral(red: 0.9803921569, green: 0.7764705882, blue: 0.1058823529, alpha: 1.0),
                                   hex: "#FAC61BFF",
                                   rgb: RGB(red: 250, green: 198, blue: 27)).literal
        }
    }
}
