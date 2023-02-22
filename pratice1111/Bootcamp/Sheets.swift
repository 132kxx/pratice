//
//  Sheets.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/22.
//

import SwiftUI

struct Sheets: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background {
                        Color.white.cornerRadius(20)
                    }
            }
            .sheet(isPresented: $showSheet) {
                SecontScreen()
            }
        }
    }
}

struct SecontScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(20)
            }
        }
    }
}

struct Sheets_Previews: PreviewProvider {
    static var previews: some View {
        Sheets()
    }
}
