//
//  FavoritesView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/27/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    @State var showFilterSheet: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedReadingStatus: ReadingStatus?
    
    
    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // Computed Variable
    private var favoriteBooks: [Binding<Book>] {
        $books.filter {
            $0.wrappedValue.isFavorite // is the book a favorite
            && ( // and
                selectedGenre == nil // did user select genre? no or
                || $0.wrappedValue.genre == selectedGenre! // yes check this
            )
            && (
                selectedReadingStatus == nil // Did user select status? no..
                || $0.wrappedValue.readingStatus == // yes.. show the status 
                selectedReadingStatus!
            )
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: gridLayout){
                    ForEach(favoriteBooks, id:\.id) { book in
                        NavigationLink(destination: DetailView(book: book)){
                            //                            BookCard(book: book)
                        }
                    }
                }
                .padding(.horizontal)
                
            }
            .navigationTitle("My Favorite Books")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        showFilterSheet.toggle()
                    }){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                    .accessibilityLabel("Open filter options")
                }
            }
            .sheet(isPresented: $showFilterSheet){
                //onDismiss
                
            } content: {
                // to add a header in the naigation stack
                FiltersView(
                    selectedGenre: $selectedGenre,
                    selectedReadingStatus: $selectedReadingStatus
                )
            }
        }
        
        
    }
    
}
