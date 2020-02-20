//
//  SpeakerRow.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/3/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import SwiftUI

struct SpeakerRow: View {
    var speaker: Speaker
    var subject: Subject
    var topic: String {
        switch (subject.name) {
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
        HStack {
            VStack(alignment: .leading) {
                Text(speaker.name)
                    .font(.title)
                Text(topic)
                    .foregroundColor(Color.gray)
            }
                .padding()
            
            Spacer()
        }
    }
}

struct SpeakerRow_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerRow(speaker: TestSpeaker.speaker, subject: Subject(name: SubjectKeys.agriculture))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
