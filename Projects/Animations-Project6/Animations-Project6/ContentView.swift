//
//  ContentView.swift
//  Animations-Project6
//
//  Created by Lê Hồng Thắng on 12/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero

    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { arg in dragAmount = arg.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy(extraBounce: 0.3)) {
                            dragAmount = .zero
                        }
                    }
            )
    }
}

#Preview {
    ContentView()
}
