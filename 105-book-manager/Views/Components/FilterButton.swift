//
//  FilterButton.swift
//  105-book-manager
//
//  Created by Samantha Roman on 11/5/25.
//

import SwiftUI

struct FilterButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Image(systemName: "line.horizontal.3.decrease.circle")
        }
        .accessibilityLabel("Open filter options")
    }
}
