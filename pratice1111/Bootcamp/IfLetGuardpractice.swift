//
//  IfLetGuardpractice.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/27.
//

import SwiftUI

struct IfLetGuardpractice: View {
    
    @State var currentUserID: String?
    @State var displayText: String?
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Here we are practicing safe doding")
                
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                
                if isLoading {
                    ProgressView()
                }
                

                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        if let userID = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new data User id is: \(userID)"
                isLoading = false
            }
        } else {
            displayText = "Error. there is not userid"

        }

    }
    
    func loadData2() {
        
        guard let userID = currentUserID else {
            displayText = "Error. there is not userid"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data User id is: \(userID)"
            isLoading = false
        }
    }
}


struct IfLetGuardpractice_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardpractice()
    }
}
