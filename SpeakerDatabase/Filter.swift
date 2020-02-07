//
//  Filter.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/4/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import SwiftUI

struct Filter: View {
    //@EnvironmentObject var filterS: FilterSel
    @EnvironmentObject var speakers: Speakers
    @Binding var dismiss: Bool
    @State var ageRange: Int = 0
    @State var comm: Int = 0
    @State var topic: Int = 0
    var topics: [String]
    var listTopics: [String] {
        var list: [String] = []
        list.append("Any")
        for a in topics {
            list.append(a)
        }
        return list
    }
    
    var body: some View {
        return VStack {
            ZStack {
                HStack {
                    Button("Done") {
                        //Sets filter selections
                        FilterSel.age = self.ageRange
                        FilterSel.comm = self.comm
                        FilterSel.topic = self.topic
                        
                        //Refines filter search
                        self.speakers.filter(ageRange: AgeKey.ages[self.ageRange], comm: CommKey.methods[self.comm], topic: TopicsKey.topics[self.topic])
                        
                        //Dismisses filter
                        self.dismiss.toggle()
                    }
                    .padding(.leading, 20.0)
                    Spacer()
                }
                Text("Filter")
                 .bold()
            }
            .padding(.top)
            
            Form {
                //Grade Range
                Section() {
                    VStack {
                        HStack {
                            Text("Grade Range")
                                .bold()
                            Spacer()
                        }
                        Picker("Grade Range", selection: self.$ageRange) {
                            ForEach(0..<AgeKey.ages.count) { index in
                                Text(AgeKey.ages[index])
                                    .tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                //Method Of Communication
                Section() {
                    VStack {
                        HStack {
                            Text("Method of Communication")
                                .bold()
                            Spacer()
                        }
                        Picker("Communication", selection: self.$comm) {
                            ForEach(0..<CommKey.methods.count) { index in
                                Text(CommKey.methods[index])
                                    .tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                //Topics
                Section() {
                    Picker(selection: self.$topic, label: (
                        Text("Topic").bold()
                    )) {
                        ForEach(0..<listTopics.count) { index in
                            Text(self.listTopics[index])
                                .tag(index)
                        }
                    }
                }
            }
            //.listStyle(GroupedListStyle())
            
            /*.navigationBarTitle("Filter")
             .navigationBarItems(leading:
              Button("Done") {
              //Sets filter selections
              FilterSel.age = self.ageRange
              FilterSel.comm = self.comm
              FilterSel.topic = self.topic
              
              //Refines filter search
              self.speakers.filter(ageRange: AgeKey.ages[self.ageRange], comm: CommKey.methods[self.comm], topic: TopicsKey.topics[self.topic])
              
              //Dismisses filter
              self.dismiss.toggle()
              })*/
        }
    }
}

struct Filter_Previews: PreviewProvider {
    @State static var f = false
    @State static var i1 = 0
    @State static var i2 = 0
    @State static var t = 0
    static let filterS = FilterSel()
    static let speakers = Speakers()
    
    static var previews: some View {
        Filter(dismiss: $f, ageRange: i1, comm: i2, topic: t, topics: TopicsKey.topics)
            .environmentObject(filterS)
            .environmentObject(speakers)
    }
}
