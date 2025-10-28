//
//  ContentView.swift
//  BookManagerCH3
//
//  Created by Jorge Gabriel Marin Urias on 10/15/25.
//
import SwiftUI
import SwiftData
struct ContentView: View {
    
    @State var books: [Book] = getBooks()
    var body: some View {
        TabView {
            BookListView(books: $books)
                .tabItem {
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView(books: $books)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
                
        }
    }
}
#Preview {
    ContentView()
}



// 1. add a state variable to show a sheet and asign false for default

// @state var showAddSheet = false

// 2. create a state variable new book to hold the new book

// @State var newBook: Book = B ook(title:"") because we don't have book title yet

// 3. then using navigation bar items training button calling the button add and then create the action to show add sheet when togle turns on or true.

// 4. then create the sheet view you want to display so if the sheet is presented and togled on

// so we have an empty book so when it presents or we hit add instead o being tied to one of the books on the list its tied to a new book and when we add it only if a title is not empty. and checks that so to this aray add new book and then we set the new book to be empty again. it runs the code and appends the book to the list.

//      .sheet(isPresented: $showAddSheet){
//          //on dismiss
//          if !newBook.title.isEmpty {
//              books.append(newBook)
//          }
//          newBook = Book(title:"")
//      } content: {
//          AddEditBookView(book: $newBook)
//      }


// this is a way to reuse the view.

