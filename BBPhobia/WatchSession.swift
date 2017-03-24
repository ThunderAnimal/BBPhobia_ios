//
//  WatchSession.swift
//  BBPhobia
//
//  Created by Martin Weber on 21/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class WatchSession: NSObject, WCSessionDelegate{
    private let mySession = WCSession.default()
    override init(){
        super.init()
    }
    func startSession(){
        mySession.delegate = self
        mySession.activate()
    }
    
    public func getSession() -> WCSession{
        return mySession
    }
    
    func sendMessage(key : String, data: Any, callback: @escaping (Bool, String) -> Void){
        let message = [key: data]
        
        if(!mySession.isPaired){
            callback(false, "Apple Watch not paired")
            return
        }
        
        if(mySession.isWatchAppInstalled == false){
            callback(false, "App is not installed on Apple Watch. Please installe the App")
            return
        }
        
        if(!mySession.isReachable){
            //HACKY starting app over heatstore 
            AppComponent.instance.getHealthController().getHealStore().startWatchApp(with: AppComponent.instance.getHealthController().getDummyWorkoutConfiguration(), completion: { (success, error) in
                if(!success){
                    callback(false, "Somthing went wrong. App can't start on Apple Watch. Please check your Apple Watch.")
                    //Log Error
                    if(error != nil){
                        print(error.debugDescription)
                    }
                    return
                }
            })
            
        }
        mySession.sendMessage(message, replyHandler: { (replyMessage: [String : Any]) in
            //HANDLE REPLY
        }) { (error) in
                callback(false, "Somthing went wrong. Cant send Message to Apple Watch")
                print(error.localizedDescription)
                return
        }
        
        callback(true, "All Done.")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let heartRate = message["HeartRate"]{
            let heartRateObj = HeartRate(date: Date(), value: heartRate as! Int)
            AppComponent.instance.getHealthController().newHeartRate(heartRate: heartRateObj)
        }

    }
    
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?){
        
    }
    func sessionDidBecomeInactive(_ session: WCSession){
        
    }
    func sessionDidDeactivate(_ session: WCSession){
        
    }
}
