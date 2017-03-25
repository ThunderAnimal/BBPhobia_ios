//
//  SensorPresenter.swift
//  BBPhobia
//
//  Created by Martin Weber on 25/03/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
class SensorPresenter{
    private let view: SensorView!
    private let watchSession: WatchSession!
    
    init(view: SensorView, watchSession: WatchSession){
        self.view = view
        self.watchSession = watchSession
    }
    
    func testSensor(){
        self.watchSession.sendMessage(key: "HelloWorld", data: "Hallo World!") { (success, errMsg) in
            if(!success){
                self.view.viewError(errMsg: errMsg)
                print(errMsg)
            }else{
                self.view.alterHelloWorld()
            }
        }
    }
}
