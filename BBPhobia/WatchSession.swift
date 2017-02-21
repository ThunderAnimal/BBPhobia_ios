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
    
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?){
        
    }
    func sessionDidBecomeInactive(_ session: WCSession){
        
    }
    func sessionDidDeactivate(_ session: WCSession){
        
    }
}
