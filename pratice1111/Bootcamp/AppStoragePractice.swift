//
//  AppStoragePractice.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/28.
//

import SwiftUI

struct AppStoragePractice: View {
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack {
            if let username = currentUserName {
                Text(username)
            }
            
            Button("Save".uppercased()) {
                let name: String = "emily"
                currentUserName = name
            }
        }

    }
}

struct AppStoragePractice_Previews: PreviewProvider {
    static var previews: some View {
        AppStoragePractice()
    }
}
