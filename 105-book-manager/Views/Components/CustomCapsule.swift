//
//  CustomCapsule.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/22/25.


//
//Text("write this text")
// Capsule("Write this text", Color.accentColor)

import SwiftUI
struct CustomCapsule: View {
    
    let text: String
    var color: Color = .accentColor.opacity(0.5)
    
    
    
    var body: some View {
        
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color) // background to be the color we will pass down
            .clipShape(Capsule())
        
    }
}
