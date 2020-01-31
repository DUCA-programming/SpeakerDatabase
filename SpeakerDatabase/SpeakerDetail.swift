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
    ZStack{
        HStack{
            VStack{
                VStack{
                Text(speaker.name)
                    .font(.title)
                    .bold()
                }
                .padding(.top)
                VStack{
                Divider()
                Text("Email")
                Text(speaker.email)
                    .font(.system(size: 23))
                }
                VStack{
                Divider()
                Text("Grade")
                Text(speaker.ageRange)
                    .font(.system(size: 23))
                }
                VStack{
                Divider()
                Text("communication")
                Text(speaker.comm)
                    .font(.system(size: 23))
                }
                VStack{
                Divider()
                Text("Topic")
                Text(speaker.topic)
                    .font(.system(size: 23))
                    
                }

                
                
                Spacer()
            }
            .padding(.top)
            
            Spacer()
        }
            .padding()
    }
}

struct SpeakerDetail_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerDetail(speaker: TestSpeaker.speaker)
    }
}
}
