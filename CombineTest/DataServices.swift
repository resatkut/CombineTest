//
//  DataServices.swift
//  CombineTest
//
//  Created by Reşat Kut on 30.08.2022.
//

import Foundation
import Combine

class AdvancedCombineDataService {
    
    //@Published var basicPublisher: String = "first publish"
    //let currentValuePublisher = CurrentValueSubject<Int, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = [1,2,3,4,5,6,7,8,9,10]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                
                if (x > 4 && x < 8) {
                    self.boolPublisher.send(true)
                    self.intPublisher.send(999)
                } else {
                    self.boolPublisher.send(false)
                }

                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.passThroughPublisher.send(1)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.passThroughPublisher.send(2)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passThroughPublisher.send(3)
//        }
        
    }
    
}
