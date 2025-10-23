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
                    TextEditor(text: $book.description)
                        .frame(height: 100)
                }
            }
        }
        Text(book.title)
    }
}
