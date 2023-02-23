//
//  Popover.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/23.
//

//sheets
//animations
//transitions


import SwiftUI

struct Popover: View {
    @State var showNewScreen: Bool = false
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button {
                    withAnimation(.spring()) {
                        showNewScreen.toggle()
                    }
                } label: {
                    Text("Button")
                        .font(.largeTitle)
                }
                
                //Method 1 - sheet
//                .sheet(isPresented: $showNewScreen) {
//                    NewScreen()
//                }
                
                
                //Method 2 - transitions
//                ZStack {
//                    if showNewScreen {
//                        NewScreen(showNewScreen: $showNewScreen)
//                            .padding(.top, 100)
//                            .transition(.move(edge: .bottom))
//
//                    }
//                }
//                .zIndex(2.0)
//
                NewScreen(showNewScreen: $showNewScreen)
                    .padding(.top, 100)
                    .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                    .animation(.spring(), value: showNewScreen)
                
                
                Spacer()

            }
        }
    }
}


struct NewScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .edgesIgnoringSafeArea(.all)
            Button {
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            }

            
        }
    }
}


struct Popover_Previews: PreviewProvider {
    static var previews: some View {
        Popover()
    }
}
