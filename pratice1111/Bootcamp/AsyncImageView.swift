//
//  AsyncImage.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/01.
//

import SwiftUI

struct AsyncImageView: View {
    
    let url = URL(string: "https://images.unsplash.com/photo-1677552929439-082dabf4e88f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80")
    
    var body: some View {
//        AsyncImage(url: url, content: { Image in
//            Image
//                .resizable()
//                .scaledToFill()
//                .frame(width: 300, height: 300)
//                .cornerRadius(20)
//        }, placeholder: {
//            ProgressView()
//        })
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty: ProgressView()
            case .success(let image):
                image.resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .shadow(radius: 10)
            case .failure(let error):
                VStack(alignment: .center) {
                    Image(systemName: "network.badge.shield.half.filled")
                        .resizable()
                        .scaledToFit()
                        .font(.largeTitle)
                        .frame(width: 100, height: 100)
                    Text("\(error.localizedDescription)")
                        .multilineTextAlignment(.center)
                        .padding()
                }.padding()
            @unknown default:
                fatalError()
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
