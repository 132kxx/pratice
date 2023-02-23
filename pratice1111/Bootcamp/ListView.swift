//
//  List.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/23.
//

import SwiftUI

struct ListView: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana"
    ]
    
    var body: some View {
        List {
            Section {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            } header: {
                Text("fruit")
            }

        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
