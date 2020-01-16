//
//  CheckView.swift
//  SpeakerDatabase
//
//  Created by Avery Taylor on 1/15/20.
//  Copyright © 2020 TJAProgramming. All rights reserved.
//

import SwiftUI

struct CheckView: View {
    //@State var isChecked: Bool
    @Binding var checked: Bool
    var title:String
    //func toggle(){isChecked = !isChecked}
    var body: some View {
        /*Button(action: {self.checked.toggle()}){
            HStack{
                Image(systemName: checked ? "checkmark.square": "square")
                Text(title)
            }
        }*/
        Group {
            HStack {
                Image(systemName: checked ? "checkmark.square": "square")
                Text(title)
            }
        }
        .onTapGesture {
            self.checked = !self.checked
        }
    }
}

struct CheckView_Previews: PreviewProvider {
    @State static var f = false
    
    static var previews: some View {
        CheckView(checked: $f, title: "Title")
    }
}
