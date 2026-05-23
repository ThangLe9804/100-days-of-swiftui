//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Paul Hudson on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0

    @State private var questionsLeftCount = 8
    private let endGameAlertTitle = "That's it!"
    @State private var showingEndGame = false

    var body: some View {
        ZStack {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ],
                colors: [
                    .blue, .purple, .pink,
                    .indigo, .cyan, .purple,
                    .black, .blue, .mint
                ]
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0 ..< 3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion).buttonStyle(.borderedProminent).tint(.secondary)
        } message: {
            Text("Your score is \(score)")
        }
        .alert(endGameAlertTitle, isPresented: $showingEndGame) {
            Button("Start new", action: startNewGame)

            Button("Reset", role: .destructive) {
                startNewGame()
            }

            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Final score: \(score)")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! Thats the flag of \(countries[number])"
            score -= 1
        }

        questionsLeftCount -= 1
        showAppropriateAlert()
        debugPrint(#function, questionsLeftCount)
    }

    func showAppropriateAlert() {
        if questionsLeftCount > 0 {
            showingScore = true
        } else {
            showingEndGame = true
        }
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func startNewGame() {
        score = 0
        questionsLeftCount = 8
        askQuestion()
        debugPrint(#function, questionsLeftCount)
    }
}

#Preview {
    ContentView()
}
