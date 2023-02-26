//
//  PickerView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/26.
//

import SwiftUI

struct PickerView: View {
    
    @State var selection: String = ""
    
    var body: some View {
        Picker(selection: $selection) {
            ForEach(0 ..< 10) { num in
                Text("\(num)")
            }
        } label: {
            Text("Picker")
        }
        .pickerStyle(WheelPickerStyle())

    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
