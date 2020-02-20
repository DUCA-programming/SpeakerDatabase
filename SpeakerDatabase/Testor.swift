//
//  Testor.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 2/6/20.
//  Copyright © 2020 TJAProgramming. All rights reserved.
//

import SwiftUI

struct Testor: View {
    @EnvironmentObject var speakers: Speakers
    @EnvironmentObject var selections: Selections
    @Binding var dismiss: Bool
    @State var ageRange: Int
    @State var comm: Int
    @State var topic: Int
    var topics: [String]
    var listTopics: [String] {
        var list = topics
        list.insert("Any", at: 0)
        return list
    }
    
    var body: some View {
        return NavigationView {
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
            .navigationBarTitle("Filter", displayMode: .inline)
            .navigationBarItems(leading:
                Button("Done") {
                    self.selections.age = self.ageRange
                    self.selections.comm = self.comm
                    self.selections.topic = self.topic
                    
                    self.speakers.filter(ageRange: AgeKey.ages[self.ageRange], comm: CommKey.methods[self.comm])
                    
                    //Dismisses filter
                    self.dismiss.toggle()
            })
        }
    }
}

struct Testor_Previews: PreviewProvider {
    @State static var b = true
    static let s = Speakers()
    
    static var previews: some View {
        Testor(dismiss: $b, ageRange: 0, comm: 0, topic: 0, topics: TopicsKey.topics).environmentObject(s)
    }
}
