//
//  AddEditBookView.uitest.swift
//  105-book-manager
//
//  Created by Samantha Roman on 11/10/25.
//

import XCTest

class AddEditViewUITests: XCTestCase {
    
    func testAddBookWorks() throws {
        let app = XCUIApplication()
        app.launch()
        
        let beforeAddingBookCount = app.collectionViews.firstMatch.cells.count
        
        let addBookButton = app.buttons["Add"]
        addBookButton.tap()
        let newBookTitle = "New book \(beforeAddingBookCount)"
        let titleTextField = app.textFields["Title of the book"]
        XCTAssertTrue(!app.buttons["Save"].isEnabled)
        titleTextField.tap()
        titleTextField.typeText(newBookTitle)
        print("breakpoint")
        app.buttons["Save"].tap()
        print(app.collectionViews.firstMatch)
        
        let afterAddingBookCount = app.collectionViews.firstMatch.cells.count
        XCTAssertEqual(app.collectionViews.firstMatch.cells.count, (beforeAddingBookCount + 1))
                let lastBookTitle = app.collectionViews.firstMatch.cells.element(boundBy: 0).staticTexts[newBookTitle]
                XCTAssertEqual(newBookTitle, "\(lastBookTitle)")
                
            }
        }

