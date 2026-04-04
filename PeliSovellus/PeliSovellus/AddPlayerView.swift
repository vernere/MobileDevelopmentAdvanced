//
//  AddPlayerView.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import Foundation
import SwiftUI

struct AddPlayerView: View {
    @ObservedObject var store: PlayerStore
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Player name") {
                    TextField("Enter name", text: $name)
                }
            }
            .navigationTitle("New Player")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Add") {
                        if !name.trimmingCharacters(in: .whitespaces).isEmpty {
                            store.addPlayer(name: name)
                            dismiss()
                        }
                    }
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddPlayerView(store: PlayerStore())
}
    
