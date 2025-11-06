//
//  Book.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import Foundation

struct Book: Identifiable, Codable, Equatable {
    let id = UUID()
    var title: String
    var author: String = ""
    var image: String = "default_book"
    var description: String = "" //it could be Nil because it ends with ?
    var genre: Genre = .unknown
    var rating: Int = 0
    var review: String = ""
    var readingStatus: ReadingStatus = .unknown
    var isFavorite: Bool = false
}
