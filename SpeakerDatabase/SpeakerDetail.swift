//
//  SpeakerDetail.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/4/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import SwiftUI

struct SpeakerDetail: View {
    var speaker: Speaker
    var subject: String
    var topic: String {
        switch (subject) {
            case SubjectKeys.agriculture:
                return speaker.topicAFN
            case SubjectKeys.business:
                return speaker.topicBMM
            case SubjectKeys.communication:
                return speaker.topicCIS
            case SubjectKeys.education:
                return speaker.topicHSE
            case SubjectKeys.health:
                return speaker.topicHS
            case SubjectKeys.motivation:
                return speaker.topicSTS
            default:
                return ""
        }
    }
    
    var body: some View {
        HStack{
            ScrollView {
                VStack{
                    CircleImage(image: "graybox")
                    Text(speaker.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                    
                    //Info
                    //SpeakerInfoBox(title: "Phone", text: speaker.phone)
                    VStack {
                        Divider()
                        Text("Phone")
                            .foregroundColor(Color.gray)
                        Button(action: {

                            let dash = CharacterSet(charactersIn: "-()+")

                            let cleanString = self.speaker.phone.trimmingCharacters(in: dash)

                            let tel = "tel://"
                            let formattedString = tel + cleanString
                            let url: NSURL = URL(string: formattedString)! as NSURL

                            UIApplication.shared.open(url as URL)

                        }) {
                        Text(verbatim: speaker.phone)
                            .font(.system(size: 23))
                        }
                    }
                    SpeakerInfoBox(title: "Email", text: speaker.email)
                    //SpeakerInfoBox(title: "Website", text: speaker.website)
                    SpeakerInfoBox(title: "Grades", text: speaker.ageRange)
                    SpeakerInfoBox(title: "Communication", text: speaker.comm)
                    SpeakerInfoBox(title: "Topic", text: topic)
                    SpeakerInfoBox(title: "Bio", text: speaker.bio)
                    
                    
                    Spacer()
                }
                    .padding(.top)
            }
        }
        .padding(.horizontal)
        .navigationBarTitle("", displayMode: .inline)
        
    }

struct SpeakerDetail_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerDetail(speaker: TestSpeaker.speaker, subject: SubjectKeys.agriculture)
    }
}
}
