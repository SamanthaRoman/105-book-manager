//
//  DetailView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var book: Book
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    // Coalescing operator (??) if left side is Nil do the right side
                    Image(book.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical, 20)
                    VStack{
                        Text("\(book.title)")
                            .font(.system(size: 36, weight: .bold, design: .serif))
                        if(book.author != ""){
                            Text("by \(book.author)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                HStack{
                    CustomCapsule(book.genre.rawValue, color: .secondary.opacity(0.3))
                    CustomCapsule(book.readingStatus.rawValue)
                    Spacer()
                    FavoriteToggle(isFavorite: $book.isFavorite)
                }
                Text(book.description != "" ? book.description : "No description")
                // Ternary operator (? :) if logical check is True, do after "?" else do after the ":"
                // logical check ? do_this : do_that
                if(book.review != "" || book.rating > 0){
                    Text("My Review").font(.title3)
                    if(book.rating > 0){
                        Text("Rating: \(book.rating) \( book.rating > 1 ? "stars" : "star")")
                    }
                    Text(book.review != "" ? book.review : "No review yet")
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Details") //Sets a title
        .navigationBarTitleDisplayMode(.inline) // Changes the title to be smaller
        .navigationBarItems(trailing: Button("Edit", action: {
            showEditSheet.toggle()
        }))// sets a button on the top right corner with the text "Edit"
        .sheet(isPresented: $showEditSheet, content: {
            AddEditBookView(book: $book)
        })  // presents a sheet whenever "$showEditSheet" is "true"
    }
}
