//
//  ActionsheetView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct ActionsheetView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        Button {
            showAlert.toggle()
        } label: {
            Text("Click me")
        }
        .confirmationDialog(Text("eeor"), isPresented: $showAlert) {
            Button(role: .cancel) {
                //
            } label: {
                Text("cancel")
            }
            
            Button(role: .destructive) {
                //
            } label: {
                Text("delete")
            }
            

        } message: {
            Text("This is an action sheet")
        }

    }
}

struct ActionsheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsheetView()
    }
}
