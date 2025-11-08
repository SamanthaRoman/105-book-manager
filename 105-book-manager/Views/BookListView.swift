//
//  BookListView.swift
//  BookManagerCH3
//
//  Created by Jorge Gabriel Marin Urias on 10/25/25.
//
import SwiftUI
import SwiftData

struct BookListView: View {
    
//    @Binding var books: [Book]
    @Query var books: [PersistentBook]
    @Environment(\.modelContext) private var modelContext
    @State var showAddSheet = false
    
    @State private var showFilterSheet: Bool = false
    @State private var selectedGenre: Genre?
    @State private var selectedReadingStatus: ReadingStatus?
    
    // Computed Variable
    private var filteredBooks: [PersistentBook] {
        books.filter {
            (
                selectedGenre == nil
                || $0.genre == selectedGenre
            )
            && (
                selectedReadingStatus == nil
                || $0.readingStatus == selectedReadingStatus
            )
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredBooks, id: \.id) { book in
                // Each book will display the following:
                NavigationLink(destination: DetailView(book: book)){
                    BookListItem(book: book)
                }
            }
            .navigationBarTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add", action: {
                showAddSheet.toggle()
            }))// sets a button on the top right corner with the text "Edit"
            .sheet(isPresented: $showAddSheet){
            } content: {
                AddEditBookView(modelContext: modelContext)
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
