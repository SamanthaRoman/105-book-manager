//
//  AddEditBookView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/20/25.
//

import SwiftUI

struct AddEditBookView: View {
    
    @Binding var book: Book
    // private state so no one outside can alter it
    // its a variable workingBook with type book
    @State private var workingBook: Book
    
    //have access to environments for dismiss
    @Environment(\.dismiss) var dismiss
    
    // so we have an initializer and the variable will be called book and binding it to new book
    init(book: Binding<Book>) {
        
        self._book = book // access the variable from binding and send them out directly to state
        self._workingBook = .init(initialValue: book.wrappedValue) // this is the draft book before saving hen we pass everything we did to workingBook.
        
    }
    
    var body: some View {
        NavigationStack
        {
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
                ) //. LinearGradient
                Form{
                    Section(header: Text("Book Details")) {
                        TextField("Title of the book", text: $workingBook.title)
                        TextField("Author", text: $workingBook.author)
                        Picker("Genre", selection: $workingBook.genre){
                            ForEach(Genre.allCases, id: \.self){ status in
                                Text(status.rawValue).tag(status)}
                        }
                        TextEditor(text: $workingBook.description)
                            .frame(height: 100)
                    }
                    Section(header: Text("Review")){
                        Picker("Rating", selection: $workingBook.rating){
                            // 2 ways to use integers in picker:
                            // #1:
                            // wih a tag and writing them
                            // Text("1").tag(1)
                            // Text("2")// without the tag when we pick this option it will not show because we have no tag.
                            // Text("3").tag(3)
                            // Text("4").tag(4)
                            
                            // #2:
                            // use a ForEach Loop to display the intiger with a tag.
                            Text("Not yet rated").tag(0)
                            ForEach(1...5, id: \.self){ i in
                                Text("\(i)").tag(i)
                            }
                            // for each i in 1-5
                        }
                        TextEditor(text: $workingBook.review) // Text box
                            .frame(height:100) // frame of box
                        Picker("Reading status", selection: $workingBook.readingStatus){
                            ForEach(ReadingStatus.allCases, id: \.self){ status in
                                Text(status.rawValue).tag(status)}
                            // for each status in reading stgatus we will display a raw value (( hash value is for the computer) of text that is already assigned in our enum model and add a tag behind it so we can display the status.
                        }
                    }
                }
            }
            .navigationTitle(book.title.isEmpty ? "Add Book" : "Edit Book" ) // In this navigation title if book title is empty show" add book", if there is a book title show "edit book"
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        // now we send all new values to replace the book.
                        book.title = workingBook.title
                        book.author = workingBook.author
                        book.description = workingBook.description
                        book.genre = workingBook.genre
                        book.rating = workingBook.rating
                        book.review = workingBook.review
                        book.readingStatus = workingBook.readingStatus
                        dismiss()}.disabled(workingBook.title.isEmpty)
                            
                        }
                    }
                }
            }
            //        Text(book.title)
        }
    
