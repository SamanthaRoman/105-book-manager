//
//  api.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/20/25.
//

func getBooks() -> [Book] {
    return [ Book(
                title: "The Fellowship of the Ring",
                author: "J.R.R. Tolkien",
                image: "lotr_fellowship",
                description: "The Fellowship of the Ring is the first book in the trilogy of the LORD OF THE RINGS high-fantasy triligy written by J.R>R Tolkien"
                ),
            Book(
                title: "The Two Towers",
                author: "J.R.R. Tolkien",
                image: "lotr_towers"
            ),
            Book(
                title: "The Return of the King",
                author: "J.R.R. Tolkien",
                image: "lotr_king",
                description: "The new king returns in this third and final book."
            ),
            Book(
                 title: "Test Book",
            )
        ]
}
