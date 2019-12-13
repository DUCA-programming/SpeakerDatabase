//
//  Speaker.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/3/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import Foundation

struct Speaker: Identifiable {
    var id: Int
    let name: String
    let email: String
    let ageRange: String
    let topic: String
    let comm: String
}

struct AgeKey {
    static let gk_3 = "K-3"
    static let g4_6 = "4-6"
    static let g7_8 = "7-8"
    static let g9_10 = "9-10"
    static let g11_12 = "11-12"
    static let ages = [gk_3, g4_6, g7_8, g9_10, g11_12]
}

struct TopicsKey {
    static let math = "Math"
    static let science = "Science"
    static let english = "English"
}

struct CommKey {
    static let person = "In Person"
    static let video = "Video"
    static let both = "Both"
    static let methods = [person, video, both]
}

//Temporary code
struct Database {
    static let speakers: [Speaker] = [
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
}
