//
//  MagnificationGesture.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/05.
//

import SwiftUI

struct MagnificationGestureView: View {
    
    @State private var currentMount: CGFloat = 0.0
    @State private var lastMount: CGFloat = 0.0
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red.cornerRadius(10))
            .scaleEffect(1 + currentMount + lastMount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentMount = value - 1
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            currentMount = 0
                        }
                    }

            )
    }
}


struct MagnificationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureView()
    }
}
