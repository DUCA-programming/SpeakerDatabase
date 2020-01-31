//
//  Filter.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/4/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import SwiftUI

struct Filter: View {
    @EnvironmentObject var filterS: FilterSel
    @EnvironmentObject var speakers: Speakers
    @Binding var dismiss: Bool
    @State var ageRange: Int
    @State var comm: Int
    @State var topic: Int
    
    var body: some View {
        //let stroke = 4
        NavigationView {
            ZStack {
                VStack {
                    /*ZStack {
                     HStack {
                     Button("Done") {
                     self.filterS.sel["Age"] = self.ageRange
                     self.filterS.sel["Comm"] = self.comm
                     self.filterS.sel["Topic"] = self.topic
                     self.dismiss.toggle()
                     }
                     .padding(.leading, 20.0)
                     Spacer()
                     }
                     /*Text("Filter")
                     .bold()*/
                     }
                     .padding(.top, 80.0)
                     */
                    
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
                            //VStack {
                            /*HStack {
                             Text("Topics")
                             .bold()
                             Spacer()
                             }*/
                            
                            /*List(TopicsKey.topics, id: \.self) { t in
                             //CheckView(checked: self.$topics[t]!, title: t)
                             Spacer()
                             }*/
                            Picker(selection: self.$topic, label: (
                                Text("Topic").bold()
                            )) {
                                ForEach(0..<TopicsKey.topics.count) { index in
                                    Text(TopicsKey.topics[index])
                                        .tag(index)
                                }
                            }
                            //.pickerStyle(DefaultPickerStyle)
                            //}
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
                //.background(Color.white)
                
                /*Path { path in
                 path.move(to: CGPoint(x: 0, y: 0))
                 path.addLine(to: CGPoint(x: stroke, y: 0))
                 path.addLine(to: CGPoint(x: CGFloat(stroke), y: geometry.size.height))
                 path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
                 }
                 .fill(Color.gray)*/
                
                
                
            }
            .navigationBarTitle("Filter")
            .navigationBarItems(leading:
                Button("Done") {
                    //Sets filter selections
                    self.filterS.sel["Age"] = self.ageRange
                    self.filterS.sel["Comm"] = self.comm
                    self.filterS.sel["Topic"] = self.topic
                    
                    //Refines filter search
                    self.speakers.filter(ageRange: AgeKey.ages[self.ageRange], comm: CommKey.methods[self.comm], topic: TopicsKey.topics[self.topic])
                    
                    //Dismisses filter
                    self.dismiss.toggle()
            })
        }
    }
}

struct Filter_Previews: PreviewProvider {
    @State static var f = false
    @State static var i1 = 0
    @State static var i2 = 0
    @State static var t = 0
    static let filterS = FilterSel()
    
    static var previews: some View {
        Filter(dismiss: $f, ageRange: filterS.sel["Age"]!, comm: filterS.sel["Comm"]!, topic: filterS.sel["Topic"]!).environmentObject(filterS)
    }
}

struct FilterData {
    static var ageRange = AgeKey.gk_3
    static var topic: [String] = []
    static var comm = CommKey.both
}
