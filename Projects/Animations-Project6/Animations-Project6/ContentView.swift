//
//  ContentView.swift
//  Animations-Project6
//
//  Created by Lê Hồng Thắng on 12/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        print(animationAmount)

        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            VStack {
                Stepper("Scale amount", value: $animationAmount.animation(), in: 1 ... 10)

                Spacer()

                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmount)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
