//
//  CategoryRow.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 2/4/20.
//  Copyright © 2020 TJAProgramming. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var subject: Subject
    
    var body: some View {
        HStack {
            Text(subject.name)
                .font(.title)
            Spacer()
        }
            .padding()
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(subject: Subject(name: "Marketing"))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
