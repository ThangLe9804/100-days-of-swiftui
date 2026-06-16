//
//  ContentView.swift
//  Challenge-Milestones-Project4-6
//
//  Created by Lê Hồng Thắng on 16/6/26.
//

import SwiftUI

enum QuestionCount: Int, CaseIterable {
    case five = 5

    case ten = 10

    case twenty = 20
}

struct ContentView: View {
    private let multiplicationTableRange = 2 ... 12
    init() {
        table = multiplicationTableRange.lowerBound
    }

    @State private var table: Int
    @State private var questionCount: QuestionCount = .ten

    var body: some View {
        NavigationStack {
            Form {
                Stepper("Up to \(table) times table", value: $table, in: multiplicationTableRange, step: 1)

                Section("How many questions?") {
                    Picker("How many questions?", selection: $questionCount) {
                        ForEach(QuestionCount.allCases, id: \.self) { count in
                            Text("\(count.rawValue)").tag(count)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Practice multipication")
        }
    }
}

#Preview {
    ContentView()
}
