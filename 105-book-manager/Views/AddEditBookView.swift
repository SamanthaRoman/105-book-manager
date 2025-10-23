//
//  AddEditBookView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/20/25.
//

import SwiftUI

struct AddEditBookView: View {
    @Binding var book: Book
    
    var body: some View {
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
                    TextField("Title of the book", text: $book.title)
                    TextField("Author", text: $book.author)
                    Picker("Genre", selection: $book.genre){
                        ForEach(Genre.allCases, id: \.self){ status in
                            Text(status.rawValue).tag(status)}
                    }
                    TextEditor(text: $book.description)
                        .frame(height: 100)
                }
                Section(header: Text("Review")){
                    Picker("Rating", selection: $book.rating){
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
                    TextEditor(text: $book.review) // Text box
                        .frame(height:100) // frame of box
                    Picker("Reading status", selection: $book.readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self){ status in
                            Text(status.rawValue).tag(status)}
                        // for each status in reading stgatus we will display a raw value (( hash value is for the computer) of text that is already assigned in our enum model and add a tag behind it so we can display the status.
                    }
                }
            }
        }
        Text(book.title)
    }
}
