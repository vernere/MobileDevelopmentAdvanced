//
//  AgeCalculator.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation

enum AgeCalculator {
    static func age(bornYear: Int, now: Date = .now) -> Int {
        let currentYear = Calendar.current.component(.year, from: now)
        return max(0, currentYear - bornYear)
    }
}
