//
//  UIColorExtensions.swift
//  BBPhobia
//
//  Created by Martin Weber on 05/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    func fromRgb(red: UInt, green: UInt, blue: UInt, alpha: UInt) -> UIColor{
        return UIColor(
            red: CGFloat(Double(red) / 255.0),
            green: CGFloat(Double(green) / 255.0),
            blue: CGFloat(Double(blue) / 255.0),
            alpha: CGFloat(Double(alpha) / 100)
        )
    }
}
