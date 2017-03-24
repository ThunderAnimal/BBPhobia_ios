//
//  WorkoutManager.swift
//  BBPhobia
//
//  Created by Martin Weber on 21/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
import HealthKit

class WorkoutManager{
    static let sharedManager = WorkoutManager()
    
    var workoutSession: HKWorkoutSession?
    let heathStore = HKHealthStore()
    
    func starWorkout(){
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .crossTraining
        configuration.locationType = .indoor
        
        do{
            self.workoutSession = try HKWorkoutSession.init(configuration: configuration)
        } catch{
            print(error)
        }
        self.workoutSession?.delegate = InterfaceManager.instance.mainInterface
        self.heathStore.start(self.workoutSession!)
    }
    
    func stopWorkout(){
        if let workout = self.workoutSession{
            heathStore.end(workout)
        }
    }
    
}
