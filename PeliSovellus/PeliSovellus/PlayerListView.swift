//
//  PlayerListView.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import Foundation
import SwiftUI
import SwiftData

struct PlayerListView: View {
    @Query(sort: \Player.highScore, order: .reverse) private var players: [Player]
    @Environment(\.modelContext) private var context
    
    @State private var showingAddPlayer = false
    
    
    var body: some View {
        NavigationStack {
            List(players) { player in
                NavigationLink(destination: GameView(player: player)) {
                    HStack {
                        Text(player.name)
                            .font(.headline)
                        Spacer()
                        if let score = player.highScore {
                            Text("Best: \(score)")
                                .foregroundStyle(.secondary)
                                .font(.subheadline)
                        } else {
                            Text("No games yet")
                                .foregroundStyle(.tertiary)
                                .font(.subheadline)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Players")
            .overlay(alignment: .bottomTrailing) {
                Button {
                    showingAddPlayer = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .frame(width: 56, height: 56)
                        .background(.blue)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding(24)
            }
            .sheet(isPresented: $showingAddPlayer) {
                AddPlayerView()
            }
        }
    }
}

#Preview {
    PlayerListView()
        .modelContainer(for: Player.self, inMemory: true)
}
