//
//  Mappers.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.
//

import Foundation

extension MpDto {

    func toModel() -> Mp {
        let normalisedTwitter: String? = {
            guard let t = twitter, !t.isEmpty else { return nil }
            return t
        }()
        return Mp(
            personNumber: personNumber,
            firstName: firstName,
            lastName: lastName,
            party: party,
            constituency: constituency,
            twitter: twitter,
            bornYear: bornYear,
            seatNumber: seatNumber,
            picture: picture
        )
    }
}
