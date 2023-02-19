//
//  StateBootcamp.swift
//  pratice1111
//
//  Created by kxx: on 2023/02/19.
//

import SwiftUI

struct StateBootcamp: View {
    @State var backgroundColor: Color = Color.green
    @State var count: Int = 0
    @State var title: String = "title"
    var body: some View {
        ZStack {
            //bg
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // content
            VStack(spacing: 20) {
                Text(title.capitalized)
                    .font(.title)
                    
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("button1".uppercased()) {
                        self.backgroundColor = Color.blue
                        count += 1
                        self.title = "Button1 was pressed"
                        
                    }
                    
                    
                    Button("button2".uppercased()) {
                        self.backgroundColor = Color.gray
                        count += 1
                        self.title = "Button2 was pressed"
                    }
                }
            }
        }
        .foregroundColor(.white)    }
}

struct StateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StateBootcamp()
    }
}
