//
//  ContextMenuView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct ContextMenuView: View {
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Hello, World!")
        }
        .contextMenu {
            Label("home", systemImage: "house.fill")
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
}
