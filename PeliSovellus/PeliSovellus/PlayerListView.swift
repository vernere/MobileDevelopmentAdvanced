//
//  PlayerListView.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import Foundation
import SwiftUI

struct PlayerListView: View {
    @StateObject private var store = PlayerStore()
    @State private var showingAddPlayer = false
    
    
    var body: some View {
        NavigationStack {
            List(store.players.sorted { a, b in
                (a.highScore ?? -1) > (b.highScore ?? -1)
            }) { player in
                NavigationLink(destination: GameView(player: player, store: store)) {
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
                AddPlayerView(store: store)
            }
        }
    }
}

#Preview {
    PlayerListView()
}
