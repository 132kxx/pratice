//
//  ProfileView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/28.
//

import SwiftUI

struct ProfileView: View {
    
    // app storage
     @AppStorage("username") var currentUserName: String?
     @AppStorage("userage") var currentUserAge: Int?
     @AppStorage("usergender") var currentUserGender: String?
     @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "unknown")
            Text("\(currentUserAge ?? 0)")
            Text(currentUserGender ?? "unknown")
            Text("sign out".uppercased())
                .foregroundColor(.white)
                .font(.headline)
                .frame(minHeight: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
                
        }
        .font(.title)
        .padding(10)
        .padding(.vertical, 40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
      
       
        
    }
    
    func signOut() {
        currentUserAge = nil
        currentUserName = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
