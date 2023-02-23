//
//  NavigationView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/23.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
                NavigationLink("hello", destination: MyOtherScreen())
                Text("hi")
                Text("hi")
                Text("hi")
            }
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        MyOtherScreen()
                    } label: {
                        Image(systemName: "person.fill")
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.purple
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitleDisplayMode(.inline)
                
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            }

        }
    }
}


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
