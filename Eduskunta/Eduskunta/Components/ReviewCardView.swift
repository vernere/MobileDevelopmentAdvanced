//
//  ReviewCardView.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData
import SwiftUI

struct ReviewCardView: View {
    let review: Review
    
    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "d.M.yyyy"
        return f
    }()
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: review.isPositive ? "hand.thumbsup.fill" : "exclamationmark.triangle.fill")
                .foregroundStyle(review.isPositive ? Color.green : Color.red)
                .frame(width: 20, height: 20)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(Self.dateFormatter.string(from: review.date))
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(review.text)
                    .font(.body)
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

#Preview {
    let container = try! ModelContainer(
        for: Mp.self, Review.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    let review = Review(
        date: .now,
        isPositive: true,
        text: "Hyvä puhe eduskunnassa!"
    )
    return ReviewCardView(review: review)
        .modelContainer(container)
}
