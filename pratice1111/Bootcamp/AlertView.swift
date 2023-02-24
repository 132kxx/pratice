//
//  Alert.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct AlertView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        Button {
            showAlert.toggle()
        } label: {
            Text("alert")
        }
        .alert(isPresented: $showAlert) {
           getAlert()
        }

    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("title"), message: Text("helloworld"), primaryButton: .destructive(Text("delete")), secondaryButton: .cancel())
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
