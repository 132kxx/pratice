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
    
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                } header: {
                    Text("fruit")
                }
                
                Section {
                    ForEach(veggies, id: \.self) { veggies in
                        Text(veggies.capitalized)
                    }
                } header: {
                    Text("Veggies")
                }

                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Grocery")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            }
            .tint(.red)
        }
    }
    
    var addButton: some View {
        Button {
            add()
        } label: {
            Text("Add")
        }
    }
        
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(index: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: index, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
