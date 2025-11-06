//
//  BookListView.swift
//  BookManagerCH3
//
//  Created by Jorge Gabriel Marin Urias on 10/25/25.
//
import SwiftUI

struct BookListView: View {
    
    @Binding var books: [Book]
    @State var showAddSheet = false
    @State var newBook: Book = Book(title:"")
    
    @State var showFilterSheet: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedReadingStatus: ReadingStatus?
    
    // Computed Variable
    private var filteredBooks: [Binding<Book>] {
        $books.filter {
            (
                selectedGenre == nil
                || $0.wrappedValue.genre == selectedGenre
            )
            && (
                selectedReadingStatus == nil
                || $0.wrappedValue.readingStatus == selectedReadingStatus
            )
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredBooks, id: \.self.id) { $book in
                // Each book will display the following:
                NavigationLink(destination: DetailView(book: $book)){
                    BookListItem(bookInList: book)
                }
            }
            .navigationBarTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add", action: {
                showAddSheet.toggle()
            }))// sets a button on the top right corner with the text "Edit"
            .sheet(isPresented: $showAddSheet){
                //onDismiss
                if !newBook.title.isEmpty {
                    books.append(newBook)
                }
                newBook = Book(title:"")
            } content: {
                AddEditBookView(book: $newBook)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    FilterButton(action:{ showFilterSheet.toggle()
                    })
                }
            }
            .sheet(isPresented: $showFilterSheet){
                //onDismiss
            } content: {
                FiltersView(
                    selectedGenre: $selectedGenre,
                    selectedReadingStatus: $selectedReadingStatus
                )
            }
        }
    }
}


// when we hit the button add we will change the state v ariable show addsheet that is boolian so when ever it changes it generates or re renders. togle says if its true to false.

// then the logic of sheet is that it is only presented if the value is true. Binding is used to be changable and will change it back to false.

// the sheet its self has two parts the first closure means if theres 2 things, if we run dismiss action and it's set to false then we reset it.

// The second part is that the sheet it'self is the view.
