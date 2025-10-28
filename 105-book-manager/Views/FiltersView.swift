//
//  FiltersView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/27/25.
//

import SwiftUI

struct FiltersView: View {
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Genre")){
                    Picker("Genre", selection: $selectedGenre){
                        Text("Select a genre...").tag(nil as Genre?)
                        ForEach(Genre.allCases, id: \.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header: Text("Reading Status")){
                    Picker("Reading Status", selection: $selectedReadingStatus){
                        Text("Select a status...").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self){ status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                }
            }
            .navigationTitle("Filter")
        }
    }
}


// first we start with Binding for what you want to filter. Each of them.

// second we creating the form for some context with the pickier.
