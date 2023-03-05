//
//  DragGestureView.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/05.
//

import SwiftUI

struct DragGestureView: View {
    
    @State var offSet: CGSize = .zero
    @State var endOffSet: CGSize = .zero
    
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(offSet.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 500)
                    .offset(offSet)
                    .scaleEffect(1.0)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    offSet = value.translation
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    offSet = value.translation
                                    
                                }
                            }
                )
        }
                
    }
    
//    func getScaleAmount() -> CGFloat {
//
//    }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
