//
//  CircleImage.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 1/31/20.
//  Copyright © 2020 TJAProgramming. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    let image: String
    
    var body: some View {
        Image(image)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 4)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: "graybox")
    }
}
