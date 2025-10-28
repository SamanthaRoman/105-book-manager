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
                    // Coalescing operator >> ?? expects
                    Image(book.image ?? "default-book-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical, 20)
                    VStack{
                        Text(book.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                        if(book.author != ""){
                        Text("by \(book.author)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                    } // END VStack title and author
                } // End Hstack Image and Title+Author VStack
                // pass down a custom capsul where the text is equel to the reading status raw value (the value we have set in the reading status model enum.
                HStack{
                    CustomCapsule(text: book.readingStatus.rawValue)
                    CustomCapsule(text: book.genre.rawValue, color: .secondary.opacity(0.3))
                }
    
                Text(book.description != "" ? book.description : "No description")
                
                
                // if statement:
                // ig the book has a review that doesn't equal an empty string or the rating doesn't equal zero we can then present a text saying "review"
                // depending if it is more than 1 we put stars if not just one star.
                // logic >> check ? do this : do that
                if(book.review != "" || book.rating > 0){
                    Text("My Review").font(.title3)
                    if(book.rating > 0){
                        // rating is a complete string using a backslash so the rating is converted into a string so between these variables we are using a turnarar vaiable if its rating is grater than 1 we put stars if less we put just one star.
                        Text("Rating: \(book.rating) \(book.rating > 1 ? "stars" : "star")")
                    }
                    Text(book.review != "" ? book.review: "No review yet")
                } // END if book review

            } // End VStack - housing the HStack
            .padding(.horizontal)
        }
        .navigationTitle("Details") //Sets a title
        .navigationBarTitleDisplayMode(.inline) //Changes the title to be smaller
        .navigationBarItems(trailing: Button("Edit", action: {
            showEditSheet.toggle()
        })) // sets a button on the top right corner with the text "edit"
        .sheet(isPresented: $showEditSheet, content: {
            AddEditBookView(book: $book)
        }) // presents a sheet whenever "$showEditSheet" is "true"
    }
}

//#Preview {
//    DetailView(book: $book)
//}
