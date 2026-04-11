//
//  Player.swift
//  Players
//
//  Created by Vertti on 11.4.2026.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}
