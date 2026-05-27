//
//  ContentView.swift
//  WeSplit
//
//  Created by Thang Le on 14/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0
    @State private var numberOfPeopleIndex = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    private var totalAmount: Double {
        return checkAmount * (1 + Double(tipPercentage) / 100)
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleIndex) + 2 // convert index to people count

        return totalAmount / Double(peopleCount)
    }

    let amountFormat: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: amountFormat).keyboardType(.numberPad)
                        .focused($amountIsFocused)

                    Picker("Number of people", selection: $numberOfPeopleIndex) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                }

                Section("How much tip to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ... 100, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.navigationLink)
                }

                Section("Total amount") {
                    Text(totalAmount, format: amountFormat).foregroundStyle(totalAmount == 0 ? .red : .primary)
                }

                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
