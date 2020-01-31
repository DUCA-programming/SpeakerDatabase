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
    @Published var sel: [String: Int] = ["Age": 0, "Comm": 0, "Topic": 0]
}
