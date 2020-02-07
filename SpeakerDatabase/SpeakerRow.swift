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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(speaker.name)
                    .font(.title)
                Text(speaker.topic)
                    .foregroundColor(Color.gray)
            }
                .padding()
            
            Spacer()
        }
    }
}

struct SpeakerRow_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerRow(speaker: TestSpeaker.speaker)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
