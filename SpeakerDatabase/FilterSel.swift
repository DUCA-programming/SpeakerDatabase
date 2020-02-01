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
    //Selections
    @Published var sel: [String: Int] = ["Age": AgeKey.ages.count-1, "Comm": CommKey.methods.count-1, "Topic": 0]
}
