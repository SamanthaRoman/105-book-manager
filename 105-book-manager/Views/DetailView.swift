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
                    Image(book.image ?? "default-book-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical, 20)
                    VStack{
                        Text("The fellowship of the ring")
                            .font(.title)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                        if (book.author != nil){
                            Text("by \(book.author)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                    } // END VStack title and author
                } // End Hstack Image and Title+Author VStack
                VStack{
                    Text("Lorem ipsum dolor sit amet, nam ut harum ridens perpetua. Ne mea senserit percipitur, cu ferri corpora vel. Usu voluptua vivendum accommodare ut, pro ad malis essent expetendis, sed solet primis oportere ne. Sea pertinax petentium ex, ea debet discere sed. Ubique possim in sea.")
                    Spacer()
                    Text("Ne eirmod gubergren nam, ex justo nonumes vim, te veri philosophia eam. Mel tollit fuisset erroribus te, nam no dictas audire discere, eum modus disputationi et. Ea per case suavitate, eum semper consequat ut. Eu mei elitr oratio bonorum, eum alii timeam sadipscing cu. Impedit ceteros volutpat ne vim, mei cu graeco mediocrem.")
                } // END VStack - Description paragraphs
                Text(book.description ?? "No description")
            } // End VStack - housing the HStack
            .padding(.horizontal)
        }
        .navigationTitle(book.title) //Sets a title
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
