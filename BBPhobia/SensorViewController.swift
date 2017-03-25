//
//  SensorViewController.swift
//  BBPhobia
//
//  Created by Martin Weber on 25/03/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import UIKit

class SensorViewController: UIViewController, SensorView {
    
    @IBOutlet weak var btnTestSensor: UIButton!
    var presenter: SensorPresenter? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnTestSensor.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        
        presenter = SensorPresenter(view: self,
                                    watchSession: AppComponent.instance.getWatchSession())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onClick(_ sender: UIButton){
        switch sender {
        case btnTestSensor:
            presenter?.testSensor()
            break
        default: break
        }
    }
    
    func alterHelloWorld(){
        let alert = UIAlertController(title: "Hello World!", message: "I'm alive! GREAT!!!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func viewError(errMsg:String) {
        let alert = UIAlertController(title: "Schade", message: errMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
