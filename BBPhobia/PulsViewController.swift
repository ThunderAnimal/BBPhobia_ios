//
//  FirstViewController.swift
//  BBPhobia
//
//  Created by Martin Weber on 04/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import UIKit

class PulsViewController: UIViewController, PulsView {
    
    @IBOutlet weak var btnStartWorkout: UIButton!
    @IBOutlet weak var btnStopWorkout: UIButton!
    @IBOutlet weak var textHeartRate: UILabel!
    var presenter: PulsPresenter? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        presenter = PulsPresenter(view: self,
                                    watchSession: AppComponent.instance.getWatchSession(),
                                    healthController: AppComponent.instance.getHealthController())
        
        btnStartWorkout.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        btnStopWorkout.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        
        presenter?.requestContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onClick(_ sender: UIButton){
        switch sender {
            case btnStartWorkout:
                presenter?.startMeasure()
            case btnStopWorkout:
                presenter?.stopMeasure()
            default: break
        }
    }
    
    func viewError(errMsg:String) {
        let alert = UIAlertController(title: "Schade", message: errMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func drawState(isMeasure: Bool){
        if(isMeasure){
            btnStartWorkout.isHidden = true
            btnStopWorkout.isHidden = false
        }else{
            btnStartWorkout.isHidden = false
            btnStopWorkout.isHidden = true
        }
    }
    func drawHeartRate(value: Int){
        DispatchQueue.main.async {
            self.textHeartRate.text = String(value)
        }
    }
}

