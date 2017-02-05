//
//  LaunchScreenViewController.swift
//  BBPhobia
//
//  Created by Martin Weber on 05/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import UIKit

class LaunchScreenViewController: UIViewController {
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setNeedsStatusBarAppearanceUpdate()
    }
}
