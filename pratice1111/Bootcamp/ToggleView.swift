//
//  ToggleView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct ToggleView: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "oneline" : "offline")
            }
            .font(.title)
            
            Toggle(isOn: $toggleIsOn) {
                Text("change Status:")
                
            }
            .tint(.purple)
            
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
