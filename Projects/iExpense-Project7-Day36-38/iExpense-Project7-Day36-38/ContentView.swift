//
//  ContentView.swift
//  iExpense-Project7-Day36-38
//
//  Created by Lê Hồng Thắng on 29/7/26.
//

import SwiftUI
import Observation

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
            Button("Show Sheet") {
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                SecondView()
            }
        }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ContentView()
}
