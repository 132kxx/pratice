//
//  LongGesture.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/05.
//

import SwiftUI

struct LongGesture: View {
    
    @State var isComplete: Bool = false
    
    @State var isEnded: Bool = false
    
    var body: some View {
        VStack {
            Text("hello")
                .padding()
                .padding(.horizontal,20)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)
                .background(isEnded ? Color.blue : Color.gray)
                .cornerRadius(20)
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 1.0) {
                    withAnimation(.easeInOut) {
                        isComplete.toggle()
                    }
                } onPressingChanged: {_ in
                    withAnimation(.easeInOut) {
                        isEnded.toggle()
                    }
                }

        }
        .padding(40)
    }
}

struct LongGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongGesture()
    }
}

