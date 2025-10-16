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
    var books: [Book] = [
        Book(
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
            image: "lotr_king"
        )
   ]
    
    
    
    
        var body: some View {
            NavigationStack {
                List(books, id: \.self.title) { book in
                    // create your navigation link that will estantiate a new detail view
                    NavigationLink(destination: DetailView()){
                    // Each book will display the following:
                    HStack{
                        Image(book.image ?? "") // ?? >> nullish coalescing operator
                            .resizable()
                            .frame(width: 50, height: 70)
                        VStack(alignment: .leading) {
                            Text(book.title)
                            Text(book.author)
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                }.navigationBarTitle("Book Manager")
            }
        }
    }

#Preview {
    ContentView()
}
