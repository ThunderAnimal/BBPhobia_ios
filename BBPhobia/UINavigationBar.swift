//
//  UINavigationBar.swift
//  BBPhobia
//
//  Created by Martin Weber on 10/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar{
    var castShadow: String{
        get{return "DUMMY"}
        set{
            self.layer.shadowOffset = CGSize(0, 2)
            self.layer.shadowRadius = 5.0
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.5
        }
    }
}
