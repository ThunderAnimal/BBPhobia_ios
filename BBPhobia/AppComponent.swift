//
//  AppComponent.swift
//  BBPhobia
//
//  Created by Martin Weber on 09/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import HealthKit

class AppComponent {
    public static let instance = AppComponent()
    private var healthController: HealthController?
    private var watchSession: WatchSession?
    
    private init() {
    }
    
    public func getHealStore() -> HealthController{
        if(self.healthController == nil){
            healthController = HealthController()
        }
        return healthController!
    }
    
    public func getWatchSession() -> WatchSession{
        if(self.watchSession == nil){
            watchSession = WatchSession()
        }
        return watchSession!
    }
}
