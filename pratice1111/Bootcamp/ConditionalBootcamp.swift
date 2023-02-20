//
//  ConditionalBootcamp.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/20.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button {
                isLoading.toggle()
            } label: {
                Text("Circle Button: \(isLoading.description)")
            }
            
            
            
            if isLoading {
                ProgressView()
            }
            
//            Button {
//                showCircle.toggle()
//            } label: {
//                Text("Circle Button: \(showCircle.description)")
//            }
//
//            Button {
//                showRectangle.toggle()
//            } label: {
//                Text("Rectangle Button: \(showRectangle.description)")
//            }
//
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            }
//
//            if showRectangle {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//            }
//

            
        }
    }
}

struct ConditionalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBootcamp()
    }
}
