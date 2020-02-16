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
            Image(subject.image)
                //.aspectRatio(7/5, contentMode: .fill)
                //.frame(width: 70)
                .resizable()
                .frame(width: 300, height: 300*5/7)
           /* Text(subject.name)
                .font(.title)
 */
            //Spacer()
        }
        .frame(width: 200, height: 200*5/7)
            //.padding()
        //Image(subject.image)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(subject: Subject(name: "Marketing"))
            .previewLayout(.fixed(width: 300, height: 70))
 
    }
}
