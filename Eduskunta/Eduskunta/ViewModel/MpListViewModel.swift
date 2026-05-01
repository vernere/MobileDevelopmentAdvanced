//
//  MpListViewModel.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.
//

import Foundation
import SwiftData

enum GroupBy {
    case party
    case constituency
}

@MainActor
@Observable
final class MpListViewModel {
    
    private let repository: MpRepository
    
    var groupBy: GroupBy = .party
    
    init(repository: MpRepository) {
        self.repository = repository
    }
    
    func loadIfNeeded() async {
        await repository.syncMps()
    }
    
    func toggleGrouping() {
        groupBy = (groupBy == .party) ? .constituency : .party
    }
    
    func grouped(_ mps: [Mp]) -> [(key: String, value: [Mp])] {
        let dict: [String: [Mp]]
        switch groupBy {
        case .party:
            dict = Dictionary(grouping: mps, by: {$0.party})
        case .constituency:
            dict = Dictionary(grouping: mps, by: {$0.constituency})
        }
        
        return dict
            .map { (key: $0.key, value: $0.value.sorted { $0.lastName < $1.lastName})}
            .sorted { $0.key.localizedCompare($1.key) == .orderedAscending}
    }
}
