//
//  FocusStateView.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/02.
//

import SwiftUI

struct FocusStateView: View {
    
    enum OnboardingField: Hashable {
        case username
        case password
    }
    
    @State private var username: String = ""
    @State private var userpassword: String = ""
    @FocusState private var fieldInFocus: OnboardingField?

    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add your name here...", text: $username)
                .focused($fieldInFocus, equals: .username)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .padding(.leading)
                .background {
                    Color.gray.brightness(0.3)
                }
                .cornerRadius(10)
            
            TextField("Add your password here...", text: $userpassword)
                .focused($fieldInFocus, equals: .password)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .padding(.leading)
                .background {
                    Color.gray.brightness(0.3)
                }
                .cornerRadius(10)
            
            
            Button("sign Up") {
                let usernameIsValid = !username.isEmpty
                let userpasswordIsValid = !userpassword.isEmpty
                
                if usernameIsValid && userpasswordIsValid {
                    print("sign up success")
                } else if usernameIsValid {
                    fieldInFocus = .password
                } else {
                    fieldInFocus = .username
                }
                
            }

        }
        .padding(40)
        
    }
}

struct FocusStateView_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateView()
    }
}
