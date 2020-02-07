//
//  SpeakerList.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/4/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import SwiftUI


struct SpeakerList: View {
    var subject: String
    @EnvironmentObject var speakers: Speakers
    @EnvironmentObject var selections: Selections
    //@State var filterData: [Speaker] = []
    @State var showFilter = false
    var topicNames: [String] {
        return TopicsKey.organizedTopics[subject]!
    }
    
    var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
    }
    
    var body: some View {
        return ZStack(alignment: .trailing) {
            List(speakers.filteredSpeakers) { speaker in
                NavigationLink(destination: SpeakerDetail(speaker: speaker)) {
                    SpeakerRow(speaker: speaker)
                }
            }
            .navigationBarTitle("Speakers")
            .navigationBarItems(trailing:
                Button("Filter") {
                    withAnimation {
                        self.showFilter = true
                    }
                }.sheet(isPresented: $showFilter) {
                    Testor(dismiss: self.$showFilter, ageRange: self.selections.age, comm: self.selections.comm, topic: self.selections.topic, topics: self.topicNames)
                        .environmentObject(self.speakers)
                        .environmentObject(self.selections)
                }
            )
            
            //.disabled(showFilter)
            
            //.blur(radius: showFilter ? 2 : 0)
            
            /*if showFilter {
                Filter(dismiss: $showFilter, ageRange: filterS.sel["Age"]!, comm: filterS.sel["Comm"]!, topic: filterS.sel["Topic"]!, topics: topicNames)
                    .environmentObject(filterS)
                    .transition(.move(edge: .trailing))
                    .environmentObject(speakers)
                //.frame(width: 300)
                //.shadow(radius: 10)
            }*/
        }
    }
}

struct SpeakerList_Previews: PreviewProvider {
    static let filterS = FilterSel()
    static let speakers = Speakers()
    
    static var previews: some View {
        VStack {
            SpeakerList(subject: SubjectKeys.business)
                .environmentObject(speakers)
            //Spacer()
        }
    }
}
