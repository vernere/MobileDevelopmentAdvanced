//
//  ContentView.swift
//  YliAliPeli
//
//  Created by Vertti on 28.3.2026.
//

import SwiftUI

struct ContentView: View {
    let game = YliAliGame()
    @State private var guess = ""
    @State private var result = ""
    @State private var numberOfGuesses = 0

    var body: some View {
        VStack {
            Text("Welcome to guessing game")

            Text(result)

            TextField("Make guess 0..10", text: $guess)
                .onSubmit {
                    let numberGuess = guess.codingKey.intValue
                    let st = game.makeGuess(guess: numberGuess ?? 0)
                    result = "\(st)"
                    numberOfGuesses += 1
                }
                .padding(.horizontal, 115)
            
            Text(result == "Hit" ? "You've won!: Number of guesses \(numberOfGuesses)" : "")
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
