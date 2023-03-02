//
//  SubmitTextfieldView.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/02.
//

import SwiftUI

struct SubmitTextfieldView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            TextField("placeholder", text: $username)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background {
                    Color.gray
                }
                .cornerRadius(10)
                .onSubmit {
                    
                }
                .submitLabel(.next)
        }
        .padding(40)
    }
}

struct SubmitTextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextfieldView()
    }
}
