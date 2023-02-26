//
//  Modelpractice.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/26.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let follwerCount: Int
    let isVerified: Bool
}


struct Modelpractice: View {
    
    @State var users: [UserModel] = [
//        "Nick", "Emily", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "nick", follwerCount: 100, isVerified: false),
        UserModel(displayName: "Emily", userName: "itsemily", follwerCount: 55, isVerified: false),
        UserModel(displayName: "Samantha", userName: "ninja", follwerCount: 200, isVerified: true),
        UserModel(displayName: "Chris", userName: "Chris2009", follwerCount: 177, isVerified: false)
    ]

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                                
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                       
                        VStack {
                            Text("\(user.follwerCount)")
                                .font(.headline)
                            Text("Follwers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            
            .navigationTitle("Users")
        }
    }
}

struct Modelpractice_Previews: PreviewProvider {
    static var previews: some View {
        Modelpractice()
    }
}
