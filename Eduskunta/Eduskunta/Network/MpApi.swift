//
//  MpApi.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation

protocol MpApi {
    func getMps() async throws -> [MpDto]
}


final class MpApiClient: MpApi {
    
    private static let baseUrl = "https://users.metropolia.fi/~peterh/"
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
    }
    
    func getMps() async throws -> [MpDto] {
        guard let url = URL(string: Self.baseUrl + "mps.json") else {
            throw URLError(.badURL)
        }
        let (data, response) = try await session.data(from: url)
        if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode([MpDto].self, from: data)
    }
}
