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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
