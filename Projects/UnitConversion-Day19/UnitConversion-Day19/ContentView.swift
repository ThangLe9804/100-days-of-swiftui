//
//  ContentView.swift
//  UnitConversion-Day19
//
//  Created by Thang Le on 17/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double?
    @State private var inputUnit: UnitLength = .meters
    @State private var outputUnit: UnitLength = .feet
    let availableUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    private var result: Double {
        let inputMeasurement = Measurement(value: inputValue ?? 0, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return outputMeasurement.value
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    Picker("Choose unit", selection: $inputUnit) {
                        ForEach(availableUnits, id: \.self) {
                            Text($0.symbol)
                        }
                    }.pickerStyle(.segmented)
                    TextField(
                        "Value", value: $inputValue, format: .number
                    ).keyboardType(UIKeyboardType.decimalPad)
                }

                Section("To") {
                    Picker("Choose unit", selection: $outputUnit) {
                        ForEach(availableUnits, id: \.self) {
                            Text($0.symbol)
                        }
                    }.pickerStyle(.segmented)
                    Text(result.formatted())
                }

            }.navigationTitle(Text("Length Converter"))
        }
    }
}

#Preview {
    ContentView()
}
