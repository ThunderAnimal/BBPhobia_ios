//
//  PulsPresenter.swift
//  BBPhobia
//
//  Created by Martin Weber on 06/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import Foundation
class PulsPresenter{
    private let view: PulsView!
    
    init(view: PulsView){
        self.view = view
    }
    
    func clickHello(){
        view.alterHelloWorld()
    }
    func startWorkout(){
        AppComponent.instance.getHealStore().enableHealthKit { (authorized, error) in
            if authorized{
                print("Succes")
            }
            else{
                print(error.debugDescription)
                self.view.viewError(errMsg: error.debugDescription)
            }
        }
    }
    
    
}
