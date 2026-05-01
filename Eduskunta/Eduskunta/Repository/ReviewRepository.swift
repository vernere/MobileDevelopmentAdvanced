//
//  ReviewRepository.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData

@MainActor
final class ReviewRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addReview(to mp: Mp, isPositive: Bool, text: String) {
        let review = Review(date: .now, isPositive: isPositive, text: text, mp: mp)
        context.insert(review)
        do {
            try context.save()
        } catch {
            print("ReviewRepository save failed: \(error)")
        }
    }
}
