//
//  AddEditBookView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/20/25.
//

import SwiftUI
import Foundation
import SwiftData

struct AddEditBookView: View {
    @StateObject private var viewModel: AddEditBookViewModel
    
    @Environment(\.dismiss) var dismiss
//    @State private var workingBook: Book
    
    init(book: PersistentBook? = nil, modelContext: ModelContext){
        _viewModel = StateObject(wrappedValue: AddEditBookViewModel(book:book, modelContext: modelContext))
    }

    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            .gray.opacity(0.1),
                            .gray.opacity(0.3)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                Form {
                    Section(header: Text("Book Details")) {
                        TextField("Title of the book", text: $viewModel.title)
                        TextField("Author", text: $viewModel.author)
                        TextEditor(text: $viewModel.summary)
                            .frame(height:100)
                        Picker("Genre", selection: $viewModel.genre){
                            ForEach(Genre.allCases, id: \.self){ genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                    }
                    Section(header: Text("Review")){
                        Picker("Rating", selection: $viewModel.rating){
                            Text("Not rated yet").tag(0)
                            ForEach(1...5, id: \.self){ i in
                                Text("\(i)").tag(i)
                            }
                        }
                        TextEditor(text: $viewModel.review)
                            .frame(height:100)
                        Picker("Reading status", selection: $viewModel.readingStatus){
                            ForEach(ReadingStatus.allCases, id: \.self){ status in
                                Text(status.rawValue).tag(status)
                            }
                        }
                    }
                }
                .navigationTitle(viewModel.sheetTitle)
                
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save"){
                            viewModel.save()
                            dismiss()
                        }.disabled(viewModel.title.isEmpty)
                    }
                }
            }
        }
    }
}

