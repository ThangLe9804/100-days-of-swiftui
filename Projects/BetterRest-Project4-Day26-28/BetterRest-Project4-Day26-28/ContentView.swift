//
//  ContentView.swift
//  BetterRest-Project4-Day26-28
//
//  Created by Thang Le on 6/6/26.
//

import CoreML
import SwiftUI

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false

    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }

                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4 ... 12, step: 0.25)
                }

                Section("Daily coffee intake") {
                    Picker("Amount", selection: $coffeeAmount) {
                        ForEach(1 ..< 21) { cupsCount in
                            Text("^[\(cupsCount) cup](inflect: true)")
                        }
                    }
                }

                Section("Recommend sleep time") {
                    Text("Please go to sleep at \(calculateBedtime())").font(.headline)
                }
            }
            .navigationTitle("BetterRest")
        }
        .alert(alertTitle, isPresented: $showingAlert) {} message: {
            Text(alertMessage)
        }
    }

    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep

            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showingAlert = true
        }

        return ""
    }
}

#Preview {
    ContentView()
}
