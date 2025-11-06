//
//  AddEditView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 11/5/25.
//

import Testing
import SwiftUI
@testable import _05_book_manager

@MainActor @Suite("Favorite View Tests")
struct FavoriteViewTests {
    // We're going to test the Filter FAvorite Books Function
    // AAA Arrange Act Assert
    
    @Test("Should return an array of books containing only one element, When called with an array of of three books, Having the array with only one book with favorite property set to true")
    func testFilterFunctionWorksCorrectly() {
        // Arrange
        let arrayOfBooks = Binding.constant([
            Book(title: "Book1", isFavorite: true),
            Book(title: "Book2", isFavorite: false),
            Book(title: "Book3", isFavorite: false),
        ])
                                    
        // Act
        let actual = filterFavorityBooks(
            books: arrayOfBooks,
            selectedGenre: nil,
            selectedStatus: nil
        )
        
        // Assert
        #expect(actual.count == 1)
        #expect(actual[0].wrappedValue.title == "Book1")
    }
    
    @Test("Should return an array of books containing two books; When called with and array of 4 books, and genre as horrfeor; Having  the array of books containingv 2 books with is favority property set to tgrue and genre is horror for all of them")
    func testFilterFunctionWorksCorrectlyWithGenre() {
        // Arrange (Prepare the ground or the scenario for the testing)
        let genre = Genre.horror
        let arrayOfBooks = Binding.constant([
            Book(title: "Book1", genre: Genre.horror, isFavorite: true),
            Book(title: "Book2", genre: Genre.horror, isFavorite: false),
            Book(title: "Book3", genre: Genre.horror, isFavorite: false),
            Book(title: "Book4", genre: Genre.horror, isFavorite: true)
        ])
        
        // Act (Calling or using the unit under test UUT
        let actualResult = filterFavorityBooks(
            books: arrayOfBooks,
            selectedGenre: Genre.horror,
            selectedStatus: nil
        )
        
        // Assert
        #expect(actualResult.count == 2)
        #expect(actualResult[0].wrappedValue.title == "Book1")
        #expect(actualResult[1].wrappedValue.title == "Book4")
    }
    
}

