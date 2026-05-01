//
//  Mp.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.
//

import Foundation
import SwiftData

@Model
final class Mp {

    @Attribute(.unique) var personNumber: Int
    var firstName: String
    var lastName: String
    var party: String
    var constituency: String
    var twitter: String?
    var bornYear: Int
    var seatNumber: Int?
    var picture: String

    @Relationship(deleteRule: .cascade, inverse: \Review.mp)
    var reviews: [Review] = []

    init(
        personNumber: Int,
        firstName: String,
        lastName: String,
        party: String,
        constituency: String,
        twitter: String?,
        bornYear: Int,
        seatNumber: Int?,
        picture: String,
    ) {
        self.personNumber = personNumber
        self.firstName = firstName
        self.lastName = lastName
        self.party = party
        self.constituency = constituency
        self.twitter = twitter
        self.bornYear = bornYear
        self.seatNumber = seatNumber
        self.picture = picture
    }
}
