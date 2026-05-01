//
//  LotteryState.swift
//  Lottery
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation

struct LotteryState {
    
    var selectedNumbers: Set<Int> = []
    var drawnNumbers: [Int] = []
    var matchCount: Int? = nil
    var hasPlayed: Bool = false
}


@MainActor
@Observable
final class LotteryViewModel {
    
    private(set) var state = LotteryState()
    
    static let pickCount = 7
    static let numberRange = 1...40
    
    func toggleNumber(_ number: Int) {
        if state.selectedNumbers.contains(number) {
            state.selectedNumbers.remove(number)
        } else {
            
            guard state.selectedNumbers.count < Self.pickCount else { return }
            
            state.selectedNumbers.insert(number)
        }
    }
    
    func play() {
        guard state.selectedNumbers.count == Self.pickCount else { return }
        
        let drawn = Array(Self.numberRange).shuffled().prefix(Self.pickCount)
        let matches = state.selectedNumbers.intersection(drawn).count
        
        state.drawnNumbers = drawn.sorted()
        state.matchCount = matches
        state.hasPlayed = true
    }
    
    func reset() {
        state = LotteryState()
    }
    
}
