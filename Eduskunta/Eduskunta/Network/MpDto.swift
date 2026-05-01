//
//  MpDto.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation


struct MpDto: Decodable {
    let personNumber: Int
    let firstName: String
    let lastName: String
    let picture: String
    let party: String
    let constituency: String
    let twitter: String?
    let bornYear: Int
    let seatNumber: Int?

    private enum CodingKeys: String, CodingKey {
        case personNumber
        case first
        case last
        case picture
        case party
        case constituency
        case twitter
        case bornYear
        case seatNumber
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.personNumber = try c.decode(Int.self,    forKey: .personNumber)
        self.firstName    = try c.decode(String.self, forKey: .first)
        self.lastName     = try c.decode(String.self, forKey: .last)
        self.picture      = try c.decode(String.self, forKey: .picture)
        self.party        = try c.decode(String.self, forKey: .party)
        self.constituency = try c.decode(String.self, forKey: .constituency)
        self.twitter      = try c.decodeIfPresent(String.self, forKey: .twitter)
        self.bornYear     = try c.decode(Int.self,    forKey: .bornYear)
        self.seatNumber   = try c.decodeIfPresent(Int.self,    forKey: .seatNumber)
    }
}
