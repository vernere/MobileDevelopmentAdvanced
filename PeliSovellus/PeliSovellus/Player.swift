//
//  Player.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import Foundation
internal import Combine

class Player: Identifiable, ObservableObject {
    let id = UUID()
    var name: String
    @Published var highScore: Int?
    
    init(name: String) {
        self.name = name
    }
}
