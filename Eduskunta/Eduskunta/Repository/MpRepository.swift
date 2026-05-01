//
//  MpRepository.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.
//

import Foundation
import SwiftData

@MainActor
final class MpRepository {

    private let api: MpApi
    private let context: ModelContext

    init(api: MpApi, context: ModelContext) {
        self.api = api
        self.context = context
    }

    func syncMps() async {
        do {
            let dtos = try await api.getMps()
            try upsert(dtos: dtos)
        } catch {
            print("MpRepository sync failed: \(error)")
        }
    }

    private func upsert(dtos: [MpDto]) throws {
        let exsting = try context.fetch(FetchDescriptor<Mp>())
        let byNumber = Dictionary(
            uniqueKeysWithValues: exsting.map { ($0.personNumber, $0) }
        )
        
        for dto in dtos {
            if let mp = byNumber[dto.personNumber] {
                mp.firstName = dto.firstName
                mp.lastName = dto.lastName
                mp.party = dto.party
                mp.constituency = dto.constituency
                mp.bornYear = dto.bornYear
                mp.seatNumber = dto.seatNumber
                mp.picture = dto.picture
                mp.twitter = dto.twitter
            } else {
                context.insert(dto.toModel())
            }
        }
        try context.save()
    }
}
