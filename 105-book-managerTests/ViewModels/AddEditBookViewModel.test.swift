//
//  AddEditBookViewModel.test.swift
//  105-book-manager
//
//  Created by Samantha Roman on 11/10/25.
//

import Testing
import SwiftData
@testable import _05_book_manager

@MainActor
struct AddEditViewModelTests {
    
    @Test("ViewModel initializes correctly for a new book")
    func testNewBookInitialization() throws {
        // phase 1: Arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        
        // phase 2: Act
        let viewModel = AddEditBookViewModel(modelContext: modelContext)
        
        // phase 3: Assert
        #expect(viewModel.title == "")
        #expect(viewModel.author == "")
        // ToDo: every other field assertions
        #expect(viewModel.sheetTitle == "Add Book")
        #expect(viewModel.isSaveButtonDisabled)
    }
    @Test("ViewModel initializes correctly for an existing book")
    func testExistingBookInitialization() throws {
        // Arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        let book = PersistentBook(bookTitle: "Test Book", author: "Test Author", genre: .fantasy)
        
        // Act
        let viewModel = AddEditBookViewModel(book: book, modelContext: modelContext)
        
        //Assert
        #expect(viewModel.title == "Test Book")
        #expect(viewModel.author == "Test Author")
        // every other field assertions
        #expect(viewModel.sheetTitle == "Edit Book")
        #expect(viewModel.isSaveButtonDisabled)
        //Check small changes
                // Act 2
                viewModel.title = " \n"
                #expect(viewModel.isSaveButtonDisabled)
                // Assert2
                viewModel.title = "Test Book"
                #expect(viewModel.isSaveButtonDisabled)
                viewModel.title = "Test Book 2"
                #expect(!viewModel.isSaveButtonDisabled)
                
            }
        }
