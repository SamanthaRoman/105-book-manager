////
////  FavoritesView.swift
////  105-book-manager
////
////  Created by Samantha Roman on 10/27/25.
////
//
//import SwiftUI
//
//struct FavoritesView: View {
//    @AppStorage(SETTINGS_GRID_COLUMNS_KEY) var gridColumns: Int = SETTINGS_GRID_COLUMNS_DEFAULT_VALUE
//    
//    @Binding var books: [Book]
//    @State var showFilterSheet: Bool = false
//    @State var selectedGenre: Genre?
//    @State var selectedReadingStatus: ReadingStatus?
//    
//    private var gridLayout: [GridItem] {
//        Array(repeating: GridItem(.flexible()), count: gridColumns)
//    }
//    
//    // Computed Property
//    private var favoriteBooks: [Binding<Book>] {
//        filterFavorityBooks(
//            books: $books,
//            selectedGenre: selectedGenre,
//            selectedStatus: selectedReadingStatus
//        )
//    }
//    
//    var body: some View {
//        NavigationStack{
//            if (selectedGenre != nil || selectedReadingStatus != nil){
//                HStack{
//                    if (selectedGenre != nil) {
//                        Text("Genre: ")
//                        CustomCapsule(selectedGenre!.rawValue)
//                    }
//                    if (selectedReadingStatus != nil){
//                        Text("Status: ")
//                        CustomCapsule(selectedReadingStatus!.rawValue)
//                    }
//                }
//                .padding()
//            }
//            ScrollView{
//                if (favoriteBooks.isEmpty){
//                    VStack{
//                        Spacer()
//                        Image(systemName: "book.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.secondary)
//                        Text("No favorite books found")
//                            .font(.headline)
//                            .foregroundColor(.secondary)
//                        Spacer()
//                    }
//                    .padding()
//                } else{
//                    LazyVGrid(columns: gridLayout){
//                        ForEach(favoriteBooks, id:\.id) { book in
//                            NavigationLink(destination: DetailView(book: book)){
//                                BookCard(book: book)
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .navigationTitle("My Favorite Books")
//            .toolbar{
//                ToolbarItem(placement: .topBarLeading){
//                    FilterButton(action:{ showFilterSheet.toggle()
//                    })
//                }
//            }
//            .sheet(isPresented: $showFilterSheet){
//                //onDismiss
//            } content: {
//                FiltersView(
//                    selectedGenre: $selectedGenre,
//                    selectedReadingStatus: $selectedReadingStatus
//                )
//            }
//        }
//    }
//}
//
//func filterFavorityBooks(
//    books: Binding<[Book]>,
//    selectedGenre: Genre?,
//    selectedStatus: ReadingStatus?,
//    isNegative: Bool? = false
//) -> [Binding<Book>] {
//    books.filter {
//            $0.wrappedValue.isFavorite
//            && (
//                selectedGenre == nil
//                || $0.wrappedValue.genre == selectedGenre
//            )
//            && (
//                selectedStatus == nil
//                || $0.wrappedValue.readingStatus == selectedStatus
//            )
//        }
//}
