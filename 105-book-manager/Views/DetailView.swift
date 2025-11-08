//
//  DetailView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import SwiftUI


struct DetailView: View {
    var book: PersistentBook
    @State private var isFavorite: Bool = false
    @State private var showEditSheet: Bool = false
    @Environment(\.modelContext) private var modelContext
    init(book: PersistentBook){
        self.book = book
        isFavorite = book.isFavorite
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    // Coalescing operator (??) if left side is Nil do the right side
                    Image(uiImage:
                            (book.imageData != nil ? UIImage(data:book.imageData!) :
                                UIImage(resource: .defaultbook))!
                          )
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
                    FavoriteToggle(isFavorite: $isFavorite)
                        .onChange(of: isFavorite){
                            book.isFavorite = isFavorite
                            try? modelContext.save()
                        }
                }
                Text(book.summary != "" ? book.summary : "No summary")
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
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action: {
            showEditSheet.toggle()
        }))
        .sheet(
            isPresented: $showEditSheet,
            content: {
                AddEditBookView(book: book, modelContext: modelContext)
            })
    }
}
