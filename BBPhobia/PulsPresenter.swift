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
    private let watchSession: WatchSession!
    private let healthController: HealthController!
    
    init(view: PulsView, watchSession: WatchSession, healthController: HealthController){
        self.view = view
        self.watchSession = watchSession
        self.healthController = healthController
    }
    func requestContent(){
        view.drawState(isMeasure: false)
    }
    
    func startMeasure(){
        //CHECK if is Enbale Healtkit
        self.healthController.enableHealthKit { (authorized, error) in
            if(!authorized){
                print(error.debugDescription)
                self.view.viewError(errMsg: error.debugDescription)
                return
            }
        }
        
        self.watchSession.sendMessage(key: "startWorkout", data: "start") { (success, errMsg) in
            if(success){
                self.view.drawState(isMeasure: true)
                self.healthController.addObserverHeartRate(observer: self)
            }else{
                self.view.viewError(errMsg: "Can't start." + errMsg)
            }
        }
    }
    func stopMeasure(){
        self.watchSession.sendMessage(key: "stopWorkout", data: "stop") { (success, errMsg) in
            if(success){
                self.view.drawState(isMeasure: false)
                self.healthController.removeObserverHeartRate(observer: self)
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
