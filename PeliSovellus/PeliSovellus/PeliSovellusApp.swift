//
//  PeliSovellusApp.swift
//  PeliSovellus
//
//  Created by Vertti on 4.4.2026. 2400345
//

import SwiftUI
import SwiftData

@main
struct PeliSovellusApp: App {
    var body: some Scene {
        WindowGroup {
            PlayerListView()
        }
        .modelContainer(for: Player.self)
    }
}
