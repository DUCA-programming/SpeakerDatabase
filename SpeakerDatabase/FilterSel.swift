//
//  FilterSel.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/22/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import Foundation

//Keeps the selections in the filter tab
class FilterSel: ObservableObject {
    static var age = AgeKey.ages.count-1
    static var comm = CommKey.methods.count-1
    static var topic = 0
    
    static func reset() {
        age = AgeKey.ages.count-1
        comm = CommKey.methods.count-1
        topic = 0
    }
}

class Selections: ObservableObject {
    @Published var age = AgeKey.ages.count-1
    @Published var comm = CommKey.methods.count-1
    @Published var topic = 0
}
