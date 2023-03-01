//
//  List2View.swift
//  pratice1111
//
//  Created by kxx: on 2023/03/01.
//

import SwiftUI

struct List2View: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana"
    ]
    
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    
            }.onDelete(perform: delete)
        }
        
        }
    
    func delete(indexset: IndexSet) {
        
    }
}

struct List2View_Previews: PreviewProvider {
    static var previews: some View {
        List2View()
    }
}
