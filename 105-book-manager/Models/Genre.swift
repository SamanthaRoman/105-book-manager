//
//  Genre.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/22/25.
//

enum Genre: String, CaseIterable, Codable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case scienceFiction = "Science Fiction"
    case romance = "Romance"
    case horror = "Horror"
    case dystopian = "Dystopian"
    // Base case
    case unknown = "Unknown"
}
