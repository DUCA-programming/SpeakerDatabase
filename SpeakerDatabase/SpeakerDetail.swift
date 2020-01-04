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
        HStack {
            VStack(alignment: .leading) {
                Text(speaker.name)
                    .font(.title)
                    .bold()
                Text(" ")
                Text("Email")
                Text(speaker.email)
                    .font(.system(size: 23))
                Text(" ")
                Text("Grade")
                Text(speaker.ageRange)
                    .font(.system(size: 23))
                
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
        SpeakerDetail(speaker: Database.speakers[0])
    }
}
