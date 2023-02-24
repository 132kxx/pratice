//
//  TextfieldView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct TextfieldView: View {
    
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    @State var showArray: Bool = false
    @State var arrayPlus: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("input", text: $textFieldText)
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(30))
                    .font(.headline)
                
                Button {
                    saveText()
                    textFieldText = ""
                    showArray.toggle()
                } label: {
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                
                

                
                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
        
       
    }
    
    func saveText() {
        dataArray.append(textFieldText)
    }
}

struct TextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldView()
    }
}
