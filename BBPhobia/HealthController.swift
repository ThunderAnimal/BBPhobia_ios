//
//  HealthController.swift
//  BBPhobia
//
//  Created by Martin Weber on 11/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import HealthKit
import WatchKit

protocol ObserverHeartRate: class {
    func notifyNewHeartRate(heartRate: HeartRate)
}

class HealthController {
    private let healthStore = HKHealthStore()
    private var listObserverHeartRate = [ObserverHeartRate]()
    
    //public dynamic heartRate =  heartRate? = nil
    
    
    public func getHealStore() -> HKHealthStore{
        return healthStore
    }
    
    public func addObserverHeartRate(observer :ObserverHeartRate){
        listObserverHeartRate.append(observer)
    }
    
    public func removeObserverHeartRate(observer: ObserverHeartRate){
        for i in listObserverHeartRate.indices {
            if listObserverHeartRate[i] === observer{
                listObserverHeartRate.remove(at: i)
                break
            }
        }
    }
    
    public func newHeartRate(heartRate: HeartRate){
        for observer in listObserverHeartRate {
            observer.notifyNewHeartRate(heartRate: heartRate)
        }
    }


    public func enableHealthKit(completion: ((_ success:Bool, _ error:Error?) -> Void)!) -> Void{
        
        // 1. Type read from HK
        var readTypes = Set<HKObjectType>()
        readTypes.insert(HKObjectType.workoutType())
        readTypes.insert(HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!)
   
        // 2. Types write to HK
        var shareTypes = Set<HKSampleType>()
        shareTypes.insert(HKSampleType.workoutType())

        // 3. Check if HK Store is available
        if !HKHealthStore.isHealthDataAvailable()
        {
                let error = NSError(domain: "de.mweber.uni.BBPhobia", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
                if( completion != nil )
                {
                    completion(false, error)
                }
                return;
        }
        
        // 4. Rewuest authorization
        healthStore.requestAuthorization(toShare: shareTypes, read: readTypes) { (success, error) -> Void in
            if let error = error {
                print(error)
            }
            if( completion != nil )
            {
                
                completion(success,error)
            }
        }
    }
    
    public func getDummyWorkoutConfiguration() -> HKWorkoutConfiguration{
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .running
        configuration.locationType = .outdoor
        
        return configuration
    }
}
