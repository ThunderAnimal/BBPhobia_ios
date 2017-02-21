//
//  WCSessionDelegate.swift
//  BBPhobia
//
//  Created by Martin Weber on 21/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import WatchConnectivity
import WatchKit

class SessionDelegate: NSObject,WCSessionDelegate{
    // Instantiate the Singleton
    static let sharedManager = SessionDelegate()
    private override init() {
        super.init()
    }
    
    // Keep a reference for the session,
    // which will be used later for sending / receiving data
    private let session = WCSession.default()
    
    // Activate Session
    // This needs to be called to activate the session before first use!
    func startSession() {
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?){
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let message = message["message from iOS app"]{
            print(message)
            WKInterfaceDevice.current().play(WKHapticType.notification)
        }
        if message["stopWorkout"] != nil{
            WorkoutManager.sharedManager.stopWorkout()
        }
    }
}
