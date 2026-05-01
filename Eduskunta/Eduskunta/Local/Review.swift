//
//  Review.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.2400345
//

import Foundation
import SwiftData

@Model
final class Review {
    var date: Date
    var isPositive: Bool
    var text: String
    var mp: Mp?
    
    init(date: Date = .now, isPositive: Bool, text: String, mp: Mp? = nil) {
        self.date = date
        self.isPositive = isPositive
        self.text = text
        self.mp = mp
    }
}
