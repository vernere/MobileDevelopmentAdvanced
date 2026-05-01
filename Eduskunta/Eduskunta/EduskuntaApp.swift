//
//  EduskuntaApp.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData
import SwiftUI

@main
struct EduskuntaApp: App {

    let modelContainer: ModelContainer = {
        let schema = Schema([Mp.self, Review.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [configuration])
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AppNavigation()
        }
        .modelContainer(modelContainer)
    }
}

