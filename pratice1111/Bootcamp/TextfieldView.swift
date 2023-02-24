//
//  TextfieldView.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct TextfieldView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        TextField("input", text: $textFieldText)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(.red)
    }
}

struct TextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldView()
    }
}
