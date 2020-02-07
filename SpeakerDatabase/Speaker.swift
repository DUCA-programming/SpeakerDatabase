//
//  Speaker.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/3/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import Foundation
import FirebaseDatabase

//MARK: Speaker
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

//MARK: Keys
struct AgeKey {
    static let gk_3 = "K-3rd"
    static let g4_6 = "4-6th"
    static let g7_8 = "7-8th"
    static let g9_10 = "9-10th"
    static let g11_12 = "11-12th"
    static let gk_12 = "K-12th"
    static let ages = [gk_3, g4_6, g7_8, g9_10, g11_12, gk_12]
}

struct TopicsKey {
    static let any = "Any"
    static let military = "Military"
    static let running = "Running"
    static let commSci = "Computer Science"
    static let math = "Math"
    static let topics = [any, military, running, commSci, math]
    
    static let organizedTopics: [String: [String]] = [
        SubjectKeys.business: ["Marketing", "Business Management & Administration", "Hospitality & Tourism"],
        SubjectKeys.health: ["Health Sciences"],
        SubjectKeys.education: ["Government & Public Administration", "Law, Public Safety, Corrections, & Security", "Human Services", "Education & Training"],
        SubjectKeys.agriculture: ["Agriculture, Food & Natural Resources"],
        SubjectKeys.communication: ["Arts, A/V Technology, & Communications", "Information Technology"],
        SubjectKeys.tech: ["Energy & Engineering", "Manufacturing", "Architecture & Construction", "Transportation, Distribution, & Logistics"],
        SubjectKeys.motivation: ["Motivational Speakers"]
    ]
}

struct CommKey {
    static let person = "In Person"
    static let video = "Video Chat"
    static let both = "Both"
    static let methods = [person, video, both]
}

struct SubjectKeys {
    static let business = "Business, Marketing, & Management"
    static let health = "Health Sciences"
    static let education = "Human Sciences & Education"
    static let agriculture = "Agriculture, Food, & Natural Resources"
    static let communication = "Communication & Information Systems"
    static let tech = "Skilled & Technical Sciences"
    static let motivation = "Motivational Speakers"
    static let subjects = [business, health, education, agriculture, communication, tech, motivation]
}

//MARK: Speakers
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
                    //print(speaker)
                }
            }
            self.speakers = speaks
            self.filteredSpeakers = speaks
        })
    }
    
    init(subject: String) {
        let topicsList: [String] = TopicsKey.organizedTopics[subject]!
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            var speaks = [Speaker]()
            for a in snapshot.children {
                var onTopic = false
                let snap = a as! DataSnapshot
                for t in topicsList {
                    if snap.childSnapshot(forPath: "SpeakSubject").value as! String == t {
                        onTopic = true
                    }
                }
                
                if onTopic {
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
                    }
                }
            }
            self.speakers = speaks
            self.filteredSpeakers = speaks
        })
        /*for topic in topicsList {
            let test = ref.chi
            print("Test:")
            print(test)
        }*/
    }
    
    func search(subject: String) {
        let topicsList: [String] = TopicsKey.organizedTopics[subject]!
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            var speaks = [Speaker]()
            for a in snapshot.children {
                var onTopic = false
                let snap = a as! DataSnapshot
                for t in topicsList {
                    if snap.childSnapshot(forPath: "SpeakSubject").value as! String == t {
                        onTopic = true
                    }
                }
                
                if onTopic {
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
                    }
                }
            }
            self.speakers = speaks
            self.filteredSpeakers = speaks
        })
    }
    
    func filter(ageRange: String, comm: String, topic: String) {
        var list: [Speaker] = []
        for a in speakers {
            if (ageRange == AgeKey.gk_12 || a.ageRange == ageRange) && (comm == CommKey.both || a.comm == comm) && (topic == TopicsKey.any || a.topic == topic) {
                list.append(a)
            }
        }
        filteredSpeakers = list
    }
}

//MARK: Category
struct Subject: Identifiable {
    var id = UUID()
    var name: String
    
    static var subjects: [Subject] {
        var list: [Subject] = []
        for a in SubjectKeys.subjects {
            list.append(Subject(name: a))
        }
        return list
    }
}

//MARK: Temp code
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
