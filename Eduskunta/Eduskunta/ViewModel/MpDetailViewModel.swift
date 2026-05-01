//
//  MpDetailViewModel.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData

@MainActor
@Observable
final class MpDetailViewModel {
    
    private let reviewRepository: ReviewRepository
    
    init(reviewRepository: ReviewRepository) {
        self.reviewRepository = reviewRepository
    }
    
    func addReview(to mp: Mp, isPositive: Bool, text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        reviewRepository.addReview(to: mp, isPositive: isPositive, text: trimmed)
    }
}
