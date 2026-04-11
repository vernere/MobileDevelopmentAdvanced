//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Vertti on 11.4.2026.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Friend.self)    }
}
