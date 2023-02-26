//
//  ViewModelpractice.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/26.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int

}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "watrmelon", count: 8)
        let fruit3 = FruitModel(name: "apple", count: 4)
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
    
}

struct ViewModelpractice: View {
    
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()

    var body: some View {
        NavigationStack {
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                            
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
                
                
            }
            .listStyle(GroupedListStyle())
            
            .navigationTitle("Fruit List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        RandomScreen(fruitViewModel: fruitViewModel)
                    } label: {
                        Image(systemName: "person.fill")
                    }

                }
            }
        }
    }
}

struct RandomScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }

        }
    }
}

struct ViewModelpractice_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelpractice()
    }
}

