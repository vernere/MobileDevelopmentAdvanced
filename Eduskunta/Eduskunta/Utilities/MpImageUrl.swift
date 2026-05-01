//
//  MpImageUrl.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026.
//

import Foundation

enum MpImageUrl {
    private static let baseUrl = "https://users.metropolia.fi/~peterh/edustajakuvat/"
    
    static func url(firstName: String, lastName: String, personNumber: Int) -> URL? {
        URL(string: "\(baseUrl)\(lastName)-\(firstName)-web-\(personNumber).jpg")
    }
}
