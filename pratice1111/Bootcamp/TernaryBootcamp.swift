//
//  TernaryBootcamp.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/22.
//

import SwiftUI

struct TernaryBootcamp: View {
    
    @State var isStartingState: Bool = false
    var body: some View {
        VStack {
            Button {
                isStartingState.toggle()
            } label: {
                Text("Butotn: \(isStartingState.description)")
            }
            
                RoundedRectangle(cornerRadius: 25)
                .fill(isStartingState ? Color.red : Color.blue)
                    .frame(width: 200, height: 100, alignment: .center)
            
            
            Spacer()

        }
    }
}

struct TernaryBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TernaryBootcamp()
    }
}
