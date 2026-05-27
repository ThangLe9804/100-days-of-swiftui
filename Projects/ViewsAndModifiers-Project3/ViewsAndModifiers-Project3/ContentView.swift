//
//  ContentView.swift
//  ViewsAndModifiers-Project3
//
//  Created by Thang Le on 24/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
        }
    }
}

#Preview {
    ContentView()
}
