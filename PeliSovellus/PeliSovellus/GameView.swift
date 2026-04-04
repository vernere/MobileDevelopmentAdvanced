//
//  GameView.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import Foundation
import SwiftUI

struct GameView: View {
    
    let player: Player
    let store: PlayerStore
    
    @State private var game = YliAliGame()
    @State private var guess = ""
    @State private var result = ""
    @State private var numberOfGuesses = 0
    @State private var gameWon = false
    @State private var startTime = Date()
    @State private var elapsedTime: Double = 0
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Guess a number between \(game.low) and \(game.high)")
                .font(.headline)
            
            if !gameWon {
                Text("Time: \(Int(elapsedTime))s")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
            }
            
            Text(result)
                .font(.title3)
                .foregroundStyle(result == "Low" ? .blue : result == "High" ? .orange : .green)
            
            if !gameWon {
                HStack {
                    TextField("Your guess", text: $guess)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 140)
                    
                    Button("Guess") {
                        submitGuess()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(guess.isEmpty)
                        
                }
            }
            
            if gameWon {
                VStack {
                    Text("You have won")
                        .font(.title2.bold())
                    Text("Guesses: \(numberOfGuesses)")
                        .foregroundStyle(.secondary)
                    Text("Score: \(computedScore)")
                        .font(.title3.bold())
                        .foregroundStyle(.blue)
                    
                    Button("Play again") {
                        resetGame()
                    }
                    .buttonStyle(.bordered)
                    .padding(.top, 4)
                }
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding()
        .navigationTitle(player.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { startTimer() }
        .onDisappear { timer?.invalidate() }
    }
    
    var computedScore: Int {
        let base = 1000
        let guessPenaly = (numberOfGuesses - 1) * 80
        let timePenaly = Int(elapsedTime) * 5
        return max(0, base - guessPenaly - timePenaly)
    }
    
    func submitGuess() {
        guard let number = Int(guess) else { return }
        let guessResult = game.makeGuess(guess: number)
        numberOfGuesses += 1
        guess = ""
        
        switch guessResult {
        case .Low: result = "Low"
        case .High: result = "High"
        case .Hit:
            result = "Hit"
            gameWon = true
            timer?.invalidate()
            elapsedTime = Date().timeIntervalSince(startTime)
            store.updateHighScore(for: player, score: computedScore)
        }
    }
    
    func startTimer() {
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
           if !gameWon {
               elapsedTime = Date().timeIntervalSince(startTime)
            }
        }
    }
    
    func resetGame() {
        game = YliAliGame()
        guess = ""
        result = ""
        numberOfGuesses = 0
        gameWon = false
        startTimer()
    }
}

#Preview {
    let store = PlayerStore()
    let player = Player(name: "Vertti")
    return NavigationStack {
        GameView(player: player, store: store)
    }
}

