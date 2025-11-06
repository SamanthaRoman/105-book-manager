//
//  api.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/20/25.
//

func getBooks() -> [Book] {
    return [
        Book(
            title:"The Fellowship of the Ring",
            author:"J.R.R. Tolkien",
            image: "lotr_fellowship",
            description: "The Fellowship of the Ring is the first book in the trilogy of the LORD OF THE RINGS high-fantasy trilogy written by J.R.R Tolkien.",
            isFavorite: true
        ),
        Book(
            title:"The Two Towers",
            author:"J.R.R. Tolkien",
            image: "lotr_towers",
            isFavorite: true
        ),
        Book(
            title:"The Return of the King",
//            author:"J.R.R. Tolkien",
            image: "lotr_king",
            description: "The Return of the King is the third and final book in J.R.R Tolkien's high-fantasy trilogy, The Lord of the Rings.",
            genre: .classic,
            readingStatus: .finished,
            isFavorite: true
        ),
        Book(
            title:"Harry Potter"
        )
    ]
}
