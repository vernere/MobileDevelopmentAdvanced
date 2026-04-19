//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by Vertti on 19.4.2026.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseYear: Date
    
    init(title: String, releaseYear: Date) {
        self.title = title
        self.releaseYear = releaseYear
    }
    
    static let sampleData = [
        Movie(title: "Amusing Space Traveler 3", releaseYear: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Difficult Cat",
              releaseYear: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Electrifying Trek",
              releaseYear: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie(title: "Reckless Train Ride 2",
              releaseYear: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "The Last Venture",
              releaseYear: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie(title: "Glamorous Neighbor",
              releaseYear: Date(timeIntervalSinceReferenceDate: -1_700_000_000)),
    ]

}

