//
//  PersistentBook.swift
//  105-book-manager
//
//  Created by Samantha Roman on 11/5/25.
//

import Testing
@testable import _05_book_manager

@MainActor @Suite("Models -- Persistent Book Tests")
struct PersistentBookTests {
    
    @Test("Should create an instance of persistent book, When initialized with valid parameters")
    func testPersistentBookInitializer() {
        // Arrange
        let bookTitle = "Test Title"
        let status = ReadingStatus.finished
        let author = "Test Auth"
        let isFavority = false
        
        // Act
        let actual = PersistentBook(
            bookTitle: bookTitle,
            author: author,
            readingStatus: status,
            isFavorite: isFavority
        )
        
        // Assert
        #expect(actual.readingStatus == ReadingStatus.finished)
        #expect(actual.isFavorite == false)
    }
    
    
    @Test("Should return a string with only the title followed by the string 'by unkown author'; when called with a book with only title")
    func testDescriptionWithKnownAuthor() {
        
        //Arrange
        let bookTitle = "Unit Test With Swift"
        let author = "Samantha Roman"
        
        //Act
        let actualBook = PersistentBook(bookTitle: bookTitle, author: author)
        let actualResult = actualBook.getNameAndAuthor()
        
        // Assert
        #expect(actualResult == "Unit Test With Swift - Samantha Roman")
        
    }

    @Test("Should return a string with only the title followed by the string 'by unkown author'; when called with a book with only title")
    func testDescriptionWithUnkownAuthor() {
        
        //Arrangve
        let bookTitle = "Test Book 1"
        
        //Act
        let actualBook = PersistentBook(bookTitle: bookTitle)
        let actualResult = actualBook.getNameAndAuthor()
        
        // Assert
        #expect(actualResult == "Test Book 1 by unkown author")
        
    }
}

