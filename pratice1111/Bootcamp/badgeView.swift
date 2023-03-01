//
//  badgeView.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/01.
//

import SwiftUI

struct badgeView: View {
    var body: some View {
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "person.fill")
                    
                }
                .badge(1)
            
            Color.orange
                .tabItem {
                    Image(systemName: "person.fill")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}


struct badgeView_Previews: PreviewProvider {
    static var previews: some View {
        badgeView()
    }
}
