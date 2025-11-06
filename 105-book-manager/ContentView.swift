//
//  ContentView.swift
//  BookManagerCH3
//
//  Created by Jorge Gabriel Marin Urias on 10/15/25.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage(SETTINGS_THEME_KEY) var theme: Theme = SETTINGS_THEME_DEFAULT_VALUE
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentTintColor: Color = SETTINGS_ACCENT_COLOR_DEFAULT_VALUE
    
    @State var books: [Book] = getBooks()
    
    // We want to test that when a book does not have a title we see an error,
    
    // We want to test that when tehre only title we can render the app
    
    // We want to test when there is no image, and you show the default

    // Computed property
    var colorScheme: ColorScheme? {
        switch(theme) {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
    
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
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                
        }
        .preferredColorScheme(colorScheme)
        //add this only if time to add the color
        .tint(accentTintColor)
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

