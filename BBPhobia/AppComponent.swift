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
    private var healStore: HKHealthStore?
    
    init() {
    }
    
    public func getHealStore() -> HKHealthStore{
        if(self.healStore == nil){
            healStore = HKHealthStore()
        }
        return healStore!
    }
}
