//
//  ScrollViewReaderpra.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/05.
//

import SwiftUI

struct ScrollViewReaderpra: View {
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                Button {
                    proxy.scrollTo(29, anchor: nil)
                } label: {
                    Text("go to 29")
                }
                ForEach(0 ..< 30) { index in
                    Text("\(index)")
                        .font(.headline)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                        .id(index)
                }
            }
        }
    }
}

struct ScrollViewReaderpra_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderpra()
    }
}
