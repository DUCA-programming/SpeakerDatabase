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
                    SpeakerInfoBox(title: "Phone", text: speaker.phone)
                    SpeakerInfoBox(title: "Email", text: speaker.email)
                    SpeakerInfoBox(title: "Website", text: speaker.website)
                    SpeakerInfoBox(title: "Grades", text: speaker.ageRange)
                    SpeakerInfoBox(title: "Communication", text: speaker.comm)
                    SpeakerInfoBox(title: "Topic", text: speaker.topic)
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
        SpeakerDetail(speaker: TestSpeaker.speaker)
    }
}
}
