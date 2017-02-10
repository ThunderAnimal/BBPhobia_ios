//
//  AppColor.swift
//  BBPhobia
//
//  Created by Martin Weber on 09/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import UIKit

class AppColor {
    //google Material Color
    public let primaryColor: UIColor
    public let primaryColorDark: UIColor
    public let primaryColorLight: UIColor
    public let primaryColorBg: UIColor
    
    //google Material Color
    public let accentColor: UIColor
    public let accentColorDark: UIColor
    public let accentColotLight: UIColor
    
    //Text color
    public let textColorDark: UIColor
    public let textColorLight: UIColor
    
    init(){
        primaryColor = UIColor.init(red: 65.0/255.0, green: 81.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        primaryColorDark = UIColor.init(red: 48.0/255.0, green: 63.0/255.0, blue: 159.0/255.0, alpha: 1.0)
        primaryColorLight = UIColor.init(red: 159.0/255.0, green: 168.0/255.0, blue: 281.0/255.0, alpha: 1.0)
        primaryColorBg = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        
        accentColor = UIColor.init(red: 255.0/255.0, green: 64.0/255.0, blue: 129.0/255.0, alpha: 1.0)
        accentColorDark = UIColor.init(red: 245.0/255.0, green: 0.0/255.0, blue: 87.0/255.0, alpha: 1.0)
        accentColotLight = UIColor.init(red: 255.0/255.0, green: 128.0/255.0, blue: 171.0/255.0, alpha: 1.0)
        
        textColorDark = UIColor.init(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        textColorLight = UIColor.white
    }
    
}
