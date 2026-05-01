//
//  LotteryScreen.swift
//  Lottery
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftUI

struct LotteryScreen: View {
    
    @State private var viewModel = LotteryViewModel()
    
    private let columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 8),
        count: 8
    )
    
    var body: some View {
        let state = viewModel.state
        
        VStack(spacing: 0) {
            Spacer().frame(height: 24)
            
            Text("Lottery")
                .font(.system(size: 26))
            
            Spacer().frame(height: 8)
            
            Text("Pick 7 numbers (\(state.selectedNumbers.count)/7)")
                .font(.system(size:14))
            
            Spacer().frame(height: 16)
            
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(Array(LotteryViewModel.numberRange), id: \.self) { number in
                    NumberBall(
                        number: number,
                        isSelected: state.selectedNumbers.contains(number),
                        isWinner: state.drawnNumbers.contains(number),
                        onTap: { viewModel.toggleNumber(number)}
                    )
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            Spacer().frame(height: 16)
            
            Button(action: viewModel.play) {
                Text("Play")
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        state.selectedNumbers.count == LotteryViewModel.pickCount
                        ? Color(.gray) : Color.gray.opacity(0.5)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .buttonStyle(.plain)
            .disabled(state.selectedNumbers.count != LotteryViewModel.pickCount)
            
            Spacer().frame(height: 8)
            
            Button(action: viewModel.reset) {
                Text("Reset")
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
            }
            .buttonStyle(.plain)
            
            if state.hasPlayed {
                Spacer().frame(height: 12)
                resultPanel(for: state)
            }
        }
        .padding(16)
    }
    
    @ViewBuilder
    private func resultPanel(for state: LotteryState) -> some View {
        VStack(spacing: 6) {
            Text("Drawn: " + state.drawnNumbers.map(String.init).joined(separator: "  .  "))
                .font(.system(size: 14))
            
            Text(message(for: state.matchCount ?? 0))
                .font(.system(size: 20))
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private func message(for matches: Int) -> String {
        switch matches {
        case 7: return "All 7 matched"
        case 6: return "All 6 matched"
        case 5: return "All 5 matched"
        case 4: return "All 4 matched"
        case 3: return "All 3 matched"
        default: return "\(matches) matches, Try again"
        }
    }
}

#Preview("Nothing picked") {
    LotteryScreen()
}
