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
    
    func starWorkout(workoutConfiguration: HKWorkoutConfiguration){
        do{
            self.workoutSession =  try HKWorkoutSession(configuration: workoutConfiguration)
            self.heathStore.start(self.workoutSession!)
        } catch {
            print(error)
        }
    }
    func stopWorkout(){
        print("stopWorkout")
        self.heathStore.end(self.workoutSession!)
    }
    
}
