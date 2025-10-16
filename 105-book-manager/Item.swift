//
//  Item.swift
//  105-book-manager
//
//  Created by Samantha Roman on 10/15/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
