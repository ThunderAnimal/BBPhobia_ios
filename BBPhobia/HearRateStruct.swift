//
//  HearRateStruct.swift
//  BBPhobia
//
//  Created by Martin Weber on 24/03/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation

class HeartRate: Equatable {
    let date: Date
    let value: Int
    
    init(date: Date, value: Int){
        self.date = date
        self.value = value
    }
    
    public static func ==(lhs: HeartRate, rhs: HeartRate) -> Bool{
        return
            lhs.date == rhs.date &&
            lhs.value == rhs.value
    }
}
