//
//  _05_book_managerApp.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import SwiftUI
import SwiftData

@main
struct _05_book_managerApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


/*
 
 
 
 
 This code:
 Image(systemName: "book)
 
 is like us saying this...
 View<Image>
 
 Then we modify itlike this to add a green boarder:
 Image(systemName: "book)
 .border(.green)
 
 Changes it to this within the code:
 View<containerwithborder<image>>
 
 
 
 
 
 
 
 */
 
