//
//  BindingBootcamp.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/20.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var bg: Color = Color.green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            bg
            .ignoresSafeArea(.all)
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                
                
                ButtonView(bg: $bg, title: $title)
            }
        }
    }
}
struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}

struct  ButtonView: View {
    @Binding var bg: Color
    @State var buttonColor: Color = Color.blue
    @Binding var title: String
    
    var body: some View {
        Button {
            bg = Color.orange
            buttonColor = Color.pink
            title = "new title"
            
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding()
                .background {
                    buttonColor
                }
                .cornerRadius(10)
            
        }
    }
}
