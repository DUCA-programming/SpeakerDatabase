//
//  SwiftUIView.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/3/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var speaker: Speaker
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(speaker.name)
                    .font(.title)
                Text(speaker.email)
                    .foregroundColor(Color.gray)
            }
                .padding()
            
            Spacer()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(speaker: Speaker(name: "AJ Taylor", email: "ajamest02@gmail.com", ageRange: AgeKey.g11_12))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
