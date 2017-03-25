//
//  SettingViewController.swift
//  BBPhobia
//
//  Created by Martin Weber on 25/03/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, SettingView {
    var presenter: SettingPresenter? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        presenter = SettingPresenter(view: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onClick(_ sender: UIButton){
    }
}
