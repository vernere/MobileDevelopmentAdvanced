//
//  Player.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import Foundation
import SwiftData

@Model
class Player {
    var name: String
    var highScore: Int?
    
    init(name: String) {
        self.name = name
    }
}
