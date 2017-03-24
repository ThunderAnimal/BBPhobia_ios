//
//  PulsPresenter.swift
//  BBPhobia
//
//  Created by Martin Weber on 06/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
class PulsPresenter: ObserverHeartRate{
    private let view: PulsView!
    
    init(view: PulsView){
        self.view = view
    }
    func requestContent(){
        view.drawState(isMeasure: false)
    }
    
    func clickHello(){
        AppComponent.instance.getWatchSession().sendMessage(key: "HelloWorld", data: "Hallo World!") { (success, errMsg) in
            if(!success){
                self.view.viewError(errMsg: errMsg)
                print(errMsg)
            }else{
                 self.view.alterHelloWorld()
            }
        }
    }
    func startMeasure(){
        //CHECK if is Enbale Healtkit
        AppComponent.instance.getHealthController().enableHealthKit { (authorized, error) in
            if(!authorized){
                print(error.debugDescription)
                self.view.viewError(errMsg: error.debugDescription)
                return
            }
        }
        
        AppComponent.instance.getWatchSession().sendMessage(key: "startWorkout", data: "start") { (success, errMsg) in
            if(success){
                self.view.drawState(isMeasure: true)
                AppComponent.instance.getHealthController().addObserverHeartRate(observer: self)
            }else{
                self.view.viewError(errMsg: "Can't start." + errMsg)
            }
        }
    }
    func stopMeasure(){
        AppComponent.instance.getWatchSession().sendMessage(key: "stopWorkout", data: "stop") { (success, errMsg) in
            if(success){
                self.view.drawState(isMeasure: false)
                AppComponent.instance.getHealthController().removeObserverHeartRate(observer: self)
            }
            else{
                self.view.viewError(errMsg: "Can't stop." + errMsg)
            }
        }
    }
    func notifyNewHeartRate(heartRate: HeartRate){
        self.view.drawHeartRate(value: heartRate.value)
    }
}
