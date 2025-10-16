//
//  DetailView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Image("lotr_king")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical, 20)
                    VStack{
                        Text("The fellowship of the ring")
                            .font(.system(size: 36, weight: .bold, design: .serif))
                        Text("by \("Author")") // by with a variable.
                            .font(.headline)
                            .foregroundColor(.secondary)
                    } // END VStack title and author
                } // End Hstack Image and Title+Author VStack
                VStack{
                    Text("Lorem ipsum dolor sit amet, nam ut harum ridens perpetua. Ne mea senserit percipitur, cu ferri corpora vel. Usu voluptua vivendum accommodare ut, pro ad malis essent expetendis, sed solet primis oportere ne. Sea pertinax petentium ex, ea debet discere sed. Ubique possim in sea.")
                    Spacer()
                    Text("Ne eirmod gubergren nam, ex justo nonumes vim, te veri philosophia eam. Mel tollit fuisset erroribus te, nam no dictas audire discere, eum modus disputationi et. Ea per case suavitate, eum semper consequat ut. Eu mei elitr oratio bonorum, eum alii timeam sadipscing cu. Impedit ceteros volutpat ne vim, mei cu graeco mediocrem.")
                } // END VStack - Description paragraphs
            } // End VStack - housing the HStack
            .padding(.horizontal)
        }
    }
}

#Preview {
    DetailView()
}
