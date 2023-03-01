//
//  BgMaterials.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/01.
//

import SwiftUI

struct BgMaterials: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Button {
                    //
                } label: {
                    Circle()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Image(systemName: "play.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .trailing)
                                .foregroundColor(.red)
                        }
  
                }

            }
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

struct BgMaterials_Previews: PreviewProvider {
    static var previews: some View {
        BgMaterials()
    }
}
