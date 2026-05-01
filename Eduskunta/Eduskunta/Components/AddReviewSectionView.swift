//
//  AddReviewSectionView.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.
//

import Foundation
import SwiftUI

struct AddReviewSectionView: View {
    
    let onSubmit: (_ isPositive: Bool, _ text: String) -> Void
    
    @State private var isPositive: Bool = true
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Lisää arvio")
                .font(.subheadline.weight(.semibold))
            
            
            Picker("", selection: $isPositive) {
                Text("Positiivinen").tag(true)
                Text("Negatiivinen").tag(false)
            }
            .pickerStyle(.segmented)
            
            TextField("Kirjoita jotain...", text: $text, axis: .vertical)
                .lineLimit(2...5)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Spacer()
                Button("Lähetä") {
                    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty else { return }
                    onSubmit(isPositive, trimmed)
                    text = ""
                }
                .buttonStyle(.borderedProminent)
                .disabled(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(16)
    }
}

#Preview {
    AddReviewSectionView(onSubmit: { _, _ in })
}
