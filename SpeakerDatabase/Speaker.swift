//
//  Speaker.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/3/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Speaker: Identifiable {
    //Searchable
    var id: Int
    let name: String
    let ageRange: String
    let topic: String
    let comm: String
    
    //Not Searchable
    let bio: String
    let phone: String
    let website: String
    let email: String
}

struct AgeKey {
    static let gk_3 = "K-3rd"
    static let g4_6 = "4-6th"
    static let g7_8 = "7-8th"
    static let g9_10 = "9-10th"
    static let g11_12 = "11-12th"
    static let ages = [gk_3, g4_6, g7_8, g9_10, g11_12]
}

struct TopicsKey {
    static let military = "Military"
    static let running = "Running"
    static let commSci = "Computer Science"
    static let math = "Math"
    static let topics = [military, running, commSci, math]
}

struct CommKey {
    static let person = "In Person"
    static let video = "Video Chat"
    static let both = "Both"
    static let methods = [person, video, both]
}

class Speakers: ObservableObject {
    //Properties
    @Published var speakers: [Speaker] = []
    @Published var filteredSpeakers: [Speaker] = []
    
    let ref = Database.database().reference()
    
    //Sets up database
    init() {
        ref.observeSingleEvent(of: .value, with: { snapshot in
            var speaks = [Speaker]()
            
            for a in snapshot.children {
                let snap = a as! DataSnapshot
                if let snapValue = snap.value as? [String:Any] {
                    let id = snapValue["SpeakID"] as! Int
                    let name = snapValue["SpeakName"] as! String
                    let bio = snapValue["SpeakBio"] as! String
                    let comm = snapValue["SpeakComStyle"] as! String
                    let email = snapValue["SpeakEmail"] as! String
                    let ageRange = snapValue["SpeakAgeRec"] as! String
                    let phone = snapValue["SpeakPhone"] as! String
                    let topic = snapValue["SpeakSubject"] as! String
                    let website = snapValue["SpeakWebsite"] as! String
                    let speaker = Speaker(id: id, name: name, ageRange: ageRange, topic: topic, comm: comm, bio: bio, phone: phone, website: website, email: email)
                    speaks.append(speaker)
                    print(speaker)
                }
            }
            self.speakers = speaks
            self.filteredSpeakers = speaks
        })
    }
    
    func filter(ageRange: String, comm: String, topic: String) {
        var list: [Speaker] = []
        for a in speakers {
            if a.ageRange == ageRange && a.comm == comm && a.topic == topic {
                list.append(a)
            }
        }
        filteredSpeakers = list
    }
    
    /*static let speakers: [Speaker] = [
        Speaker(
            id: 0,
            name: "AJ Taylor",
            email: "ajamest02@gmail.com",
            ageRange: AgeKey.g11_12,
            topic: TopicsKey.math,
            comm: CommKey.person),
        Speaker(
            id: 1,
            name: "John Doe",
            email: "john.doe@website.com",
            ageRange: AgeKey.g7_8,
            topic: TopicsKey.science,
            comm: CommKey.video),
        Speaker(
            id: 2,
            name: "Clark Donner",
            email: "somecompany@gmail.com",
            ageRange: AgeKey.g11_12,
            topic: TopicsKey.math,
            comm: CommKey.video),
        Speaker(
            id: 3,
            name: "James Taylor",
            email: "jataylor99@gmail.com",
            ageRange: AgeKey.g7_8,
            topic: TopicsKey.math,
            comm: CommKey.person),
        Speaker(
            id: 4,
            name: "Corey Mauck",
            email: "anothercompany@gmail.com",
            ageRange: AgeKey.g9_10,
            topic: TopicsKey.english,
            comm: CommKey.person),
        Speaker(
            id: 5,
            name: "Carl Kyler",
            email: "Carl.kyler@website.com",
            ageRange: AgeKey.gk_3,
            topic: TopicsKey.english,
            comm: CommKey.both),
        Speaker(
            id: 6,
            name: "Will Montgomery",
            email: "william001@gmail.com",
            ageRange: AgeKey.g4_6,
            topic: TopicsKey.science,
            comm: CommKey.both)]
    */
}

struct TestSpeaker {
    static let speaker = Speaker(
                            id: 0,
                            name: "AJ Taylor",
                            ageRange: AgeKey.g11_12,
                            topic: TopicsKey.math,
                            comm: CommKey.person,
                            bio: "Programmer",
                            phone: "402-123-4567",
                            website: "google.com",
                            email: "ajamest02@gmail.com")
}
