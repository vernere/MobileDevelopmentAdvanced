//
//  YliAliGame.swift
//  YliAliPeli
//
//  Created by Vertti on 28.3.2026.
//

import Foundation

class YliAliGame {

    enum GuessResult {
        case Low, High, Hit
    }

    let low: Int
    let high: Int
    private var guesses: [Int]
    private let secret: Int

    init(low: Int = 1, high: Int = 10) {
        self.low = low
        self.high = high
        guesses = []
        secret = Int.random(in: low...high)
        print("Secret \(secret)")
    }

    func makeGuess(guess: Int) -> GuessResult {
        guesses.append(guess)
        switch guess {
        case ..<secret:
            return .Low
        case secret:
            return .Hit
        case (secret + 1)...:
            return .High
        default:
            fatalError()
        }
    }
}
