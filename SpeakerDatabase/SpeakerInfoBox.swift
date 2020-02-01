//
//  SpeakerInfoBox.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 1/31/20.
//  Copyright © 2020 TJAProgramming. All rights reserved.
//

import SwiftUI

struct SpeakerInfoBox: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack {
            Divider()
            Text(title)
                .foregroundColor(Color.gray)
            Text(text)
                .font(.system(size: 23))
        }
    }
}

struct SpeakerInfoBox_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerInfoBox(title: "Email", text: "ajamest02@gmail.com")
    }
}
