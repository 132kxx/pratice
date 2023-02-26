//
//  Documentation.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/26.
//

import SwiftUI

struct Documentation: View {
    
    
    // MARK: PROPERTIES
    @State var data: [String] = [
        "Apple", "Orange", "Bananas"
    ]
    
    @State var showAlert: Bool = false
    
    //MARK: BODY
    
    // working copy - things to do:
    /*
     1. Fix title
     2. Fix alert
     3. Fix songthing else
     */

    var body: some View {
        NavigationStack {
            ZStack {
                //background
                Color.red.ignoresSafeArea(.all)
                
                //foreground
                foregroudLayer
                .navigationTitle("Documentation")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "gear")
                        }

                    }
                }
                .alert(isPresented: $showAlert) {
                    getAlert(text: "This is the alert!")
            }
            }
        }

    }
    
    /// this is forgroundLayer thats a scrollview
    private var foregroudLayer: some View {
        ScrollView {
            VStack {
                Text("hello")
                ForEach(data, id: \.self) { fruit in
                    Text(fruit)
                        .font(.headline)
                }
            }
        }
    }
    
    
    // MARK: FUNCTIONS
    
    /// gets an alert with a specified title
    ///
    /// This function creates and returns an alert immdiately. the alert will have a title based on the text aprameter buit it will NOT have a message
    /// ```
    /// getAlert(text: "hi") -> Alert(title: Text("hi"))
    /// ```
    ///
    /// - Warning: There is no additional message in this Alert.
    /// - Parameter text: This is the title for the alert
    /// - Returns: Returns an alert with a title
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}


    //MARK: PREVIEW

struct Documentation_Previews: PreviewProvider {
    static var previews: some View {
        Documentation()
    }
}
