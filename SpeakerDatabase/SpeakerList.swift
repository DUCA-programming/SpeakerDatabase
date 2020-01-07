//
//  SpeakerList.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 11/4/19.
//  Copyright © 2019 TJAProgramming. All rights reserved.
//

import SwiftUI


struct SpeakerList: View {
    @EnvironmentObject var filterS: FilterSel
    @State var showFilter = false
    
    var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
    }
    
    var body: some View {
        return ZStack(alignment: .trailing) {
            NavigationView {
                List(Database.speakers) { speaker in
                    NavigationLink(destination: SpeakerDetail(speaker: speaker)) {
                        SpeakerRow(speaker: speaker)
                    }
                }
                .navigationBarTitle("Speakers")
                .navigationBarItems(trailing:
                    Button("Filter") {
                        withAnimation {
                            self.showFilter = true
                        }
                    }
                )
                .disabled(showFilter)
            }
            //.blur(radius: showFilter ? 2 : 0)
            
            if showFilter {
                Filter(dismiss: $showFilter, ageRange: filterS.sel["Age"]!, comm: filterS.sel["Comm"]!)
                    .environmentObject(filterS)
                    .transition(.move(edge: .trailing))
                    //.frame(width: 300)
                    //.shadow(radius: 10)
            }
        }
    }
}

struct SpeakerList_Previews: PreviewProvider {
    static let filterS = FilterSel()
    
    static var previews: some View {
        VStack {
            SpeakerList().environmentObject(filterS)
            //Spacer()
        }
    }
}
