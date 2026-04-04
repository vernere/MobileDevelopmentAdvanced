//
//  PlayerStore.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import Foundation
internal import Combine

class PlayerStore: ObservableObject {
    @Published var players: [Player] = []
    
    func addPlayer(name: String) {
        players.append(Player(name: name))
    }
    
    func updateHighScore(for player: Player, score: Int){
        objectWillChange.send()
        if let current = player.highScore {
            player.highScore = max(current, score)
        } else {
            player.highScore = score
        }
    }
}


