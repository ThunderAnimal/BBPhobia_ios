//
//  PulsView.swift
//  BBPhobia
//
//  Created by Martin Weber on 06/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
protocol PulsView {
    func viewError(errMsg: String)
    func drawState(isMeasure: Bool)
    func drawHeartRate(value: Int)
}
