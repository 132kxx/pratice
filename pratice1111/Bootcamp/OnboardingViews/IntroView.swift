//
//  IntroView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/28.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .orange], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
            
            // if user is signed in
            
            
            // profile view
            
            
            // else
            
            
            //onboarding view
            
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
