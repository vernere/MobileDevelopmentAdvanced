//
//  AppNavigation.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData
import SwiftUI

struct AppNavigation: View {
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        let mpRepository = MpRepository(api: MpApiClient(), context: modelContext)
        let reviewRepository = ReviewRepository(context: modelContext)
        
        NavigationStack {
            MpListScreen(repository: mpRepository)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .mpDetail(let personNumber):
                        MpDetailScreen(
                            personNumber: personNumber,
                            reviewRepository: reviewRepository
                        )
                    }
                }
        }
    }
}
