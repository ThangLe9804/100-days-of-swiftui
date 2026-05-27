//
//  TitleViewModifier.swift
//  GuessTheFlag-Project2
//
//  Created by Thang Le on 28/5/26.
//

import SwiftUI

struct ProminentTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func prominentTitleStyle() -> some View {
        return modifier(ProminentTitleModifier())
    }
}
