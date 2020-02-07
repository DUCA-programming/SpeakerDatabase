//
//  CategoryList.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 2/4/20.
//  Copyright © 2020 TJAProgramming. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    //var subjects: [Subject]
    
    var body: some View {
        return NavigationView {
            List(Subject.subjects) { subject in
                NavigationLink(destination:
                    SpeakerList(subject: subject.name)
                        .environmentObject(Speakers(subject: subject.name))
                        .environmentObject(Selections())) {
                        CategoryRow(subject: subject)
                }
                //CategoryRow(subject: subject)
            }
                .navigationBarTitle("Subjects")
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    /*static var c: [Subject] {
        var b: [Subject] = []
        for a in SubjectKeys.subjects {
            b.append(Subject(name: a))
        }
        return b
    }*/

    
    static var previews: some View {
        CategoryList()
    }
}
