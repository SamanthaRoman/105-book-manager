//
//  Book.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import Foundation

struct Book: Identifiable {
    let id = UUID() // for uuid to be in scope import foundation
    var title: String
    var author: String = ""
    var image: String = "default-book-icon"
    var description: String = "" // it could be nil because it ends with ?
    var rating: Int = 0
    var review: String = ""
    // var readingStatus: String = "To Read" // Could be any string so we change it insetad of string to send an enumeration of strings
    var readingStatus: ReadingStatus = .unkown
    var genre: Genre = .unkown
    var isFavorite: Bool = false
}
