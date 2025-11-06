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
    @State private var internalGenre: Genre?
    @State private var internalReadingStatus: ReadingStatus?
    
    @Environment(\.dismiss) var dismiss
    
    init(selectedGenre: Binding<Genre?>, selectedReadingStatus: Binding<ReadingStatus?> ) {
        //copy the bindings
        self._selectedGenre = selectedGenre
        self._selectedReadingStatus = selectedReadingStatus
        
        print("copying the values \(selectedGenre.wrappedValue?.rawValue ?? "")")
        //copy the values to another state
        self._internalGenre = .init(initialValue: selectedGenre.wrappedValue)
        self._internalReadingStatus = .init(initialValue: selectedReadingStatus.wrappedValue)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Genre")){
                    Picker("Genre", selection: $internalGenre){
                        Text("Select a genre...").tag(nil as Genre?)
                        ForEach(Genre.allCases, id: \.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header: Text("Reading Status")){
                    Picker("Reading Status", selection: $internalReadingStatus){
                        Text("Select a status...").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self){ status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                }
            }
            .navigationTitle("Filter books by")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Clear"){
                        selectedGenre = nil
                        selectedReadingStatus = nil
                        internalGenre = nil
                        internalReadingStatus = nil
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Apply"){
                        selectedGenre = internalGenre
                        selectedReadingStatus = internalReadingStatus
                        dismiss()
                    }
                    .disabled(
                        internalGenre == selectedGenre
                        && internalReadingStatus == selectedReadingStatus
                    )
                }
            }
            
        }
    }
}

#Preview {
    @Previewable @State var selectedGenre: Genre? = .dystopian
    @Previewable @State var selectedReadingStatus: ReadingStatus? = .planToRead
    FiltersView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
}


// first we start with Binding for what you want to filter. Each of them.

// second we creating the form for some context with the pickier.
