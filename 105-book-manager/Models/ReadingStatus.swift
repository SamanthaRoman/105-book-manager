//
//  Reading.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/22/25.
//


enum ReadingStatus: String, CaseIterable, Codable {
    case planToRead = "Plan to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    case unknown = "Unknown"
}
