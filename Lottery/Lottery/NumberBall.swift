//
//  NumberBall.swift
//  Lottery
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftUI

struct NumberBall: View {
    let number: Int
    let isSelected: Bool
    let isWinner: Bool
    let onTap: () -> Void
    
    private var ballColor: Color {
        if isWinner { return Color(.green)}
        if isSelected { return Color(.orange)}
        return Color(.blue)
    }
    
    var body: some View {
        Button(action: onTap) {
            Text("\(number)")
                .font(.system(size: 13))
                .foregroundStyle(Color(.white))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(ballColor)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
}

#Preview("All three states") {
    HStack(spacing: 12) {
        NumberBall(number: 1,  isSelected: false, isWinner: false, onTap: {})
        NumberBall(number: 12, isSelected: true,  isWinner: false, onTap: {})
        NumberBall(number: 40, isSelected: false, isWinner: true,  onTap: {})
    }
    .frame(width: 240)
    .padding()
}

#Preview("Single — idle") {
    NumberBall(number: 7, isSelected: false, isWinner: false, onTap: {})
        .frame(width: 60, height: 60)
        .padding()
}
