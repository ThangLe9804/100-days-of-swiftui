//
//  ContentView.swift
//  Challenge-Day25
//
//  Created by Thang Le on 1/6/26.
//

import SwiftUI

enum Move: CaseIterable, CustomStringConvertible, Identifiable {
    var id: Self {
        self
    }

    case rock, paper, scissors

    var description: String {
        switch self {
        case .rock: return "🛘"
        case .paper: return "📃"
        case .scissors: return "✂️"
        }
    }
}

struct ContentView: View {
    let gameTitle = "Rock paper scissors - Win or Lose!?"

    @State var score: Int = 0

    @State var appCurrentChoice: Move = Move.allCases.randomElement()!
    @State var shouldWin: Bool = .random()

    @State var availableOptions = Move.allCases.shuffled()

    @State var answerTitle = ""
    @State var answerMessage = ""
    @State var showingAnswer = false
    @State var questionsCount: Int = 0
    @State var showingEndGame = false

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

                Text(gameTitle)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Text("Current score: \(score)")

                Text("My move is \(appCurrentChoice.description)")
                Text("Make your move so you'll \(Text(shouldWin ? "win" : "draw or lose").bold(true))")

                ForEach(availableOptions) { move in
                    Button(move.description) {
                        moveChosen(move: move)
                    }.padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }

                Spacer()
            }
            .padding()
        }
        .alert(answerTitle, isPresented: $showingAnswer) {
            Button("Continue", action: askNextQuestion).buttonStyle(.borderedProminent).tint(.secondary)
        } message: {
            Text(answerMessage)
        }
        .alert("That's everything", isPresented: $showingEndGame) {
            Button("Start new", action: startNewGame)

            Button("Reset", role: .destructive) {
                startNewGame()
            }

            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Final score: \(score)")
        }
    }

    func startNewGame() {
        questionsCount = 0
        score = 0
        askNextQuestion()
    }

    func moveChosen(move: Move) {
        var isActualWin = false
        switch appCurrentChoice {
        case .paper:
            isActualWin = move == .scissors

        case .rock:
            isActualWin = move == .paper

        case .scissors:
            isActualWin = move == .rock
        }

        if isActualWin == shouldWin {
            score += 1
            answerTitle = "Correct!"
            answerMessage = "Nice job so far!"
        } else {
            score -= 1
            answerTitle = "Wrong!"
            answerMessage = "Try harder"
        }

        questionsCount += 1
        if questionsCount >= 10 {
            showingEndGame.toggle()
        } else {
            showingAnswer.toggle()
        }
    }

    func askNextQuestion() {
        appCurrentChoice = Move.allCases.randomElement()!
        shouldWin = .random()
        availableOptions = Move.allCases.shuffled()
    }
}

#Preview {
    ContentView()
}
