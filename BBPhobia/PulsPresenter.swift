//
//  PulsPresenter.swift
//  BBPhobia
//
//  Created by Martin Weber on 06/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
class PulsPresenter{
    private let view: PulsView!
    
    init(view: PulsView){
        self.view = view
    }
    func requestContent(){
        view.drawState(isMeasure: false)
    }
    
    func clickHello(){
        view.alterHelloWorld()
        
        let session = AppComponent.instance.getWatchSession().getSession()
        session.sendMessage(["message from iOS app" : "Hello World!"], replyHandler: { reply in
            //HANLDE REPLY
        }, errorHandler: nil)
    }
    func startWorkout(){
        AppComponent.instance.getHealStore().enableHealthKit { (authorized, error) in
            if authorized{
                AppComponent.instance.getHealStore().startWorkout { (success, error) in
                    if success{
                        self.view.drawState(isMeasure: true)
                    }else{
                        self.view.drawState(isMeasure: false)
                        self.view.viewError(errMsg: error.debugDescription)
                    }
                }
            }
            else{
                print(error.debugDescription)
                self.view.viewError(errMsg: error.debugDescription)
            }
        }
    }
    func stopWorkout(){
        let session = AppComponent.instance.getWatchSession().getSession()
        session.sendMessage(["stopWorkout" : "stopWorkout"], replyHandler: { reply in
            //HANLDE REPLY
        }, errorHandler: nil)
        self.view.drawState(isMeasure: false)
    }
    
    
}
