//
//  ContentView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // we extantuate a book. then another one.
    
    @State var books: [Book] = getBooks()
    //in stat books will have a bunch of books
    
    
    
        var body: some View {
            
            NavigationStack {
                // each book will have a navigation link and each link has a book list item (the image text and author)
                // then destination link says okay when clicked take the user to this other view. so we are sending the book itself.. cash $book that is inside the state variable that is in detail view depending on what book it clicked on.
                List($books, id: \.self.title) { $book in
                    // create your navigation link that will estantiate a new detail view
                    NavigationLink(destination: DetailView(book: $book)){
                        // Each book will display the following:}
                        BookListItem(book: book)
                    }
                }.navigationBarTitle("Book Manager")
            }
        }
    }

#Preview {
    ContentView()
}
