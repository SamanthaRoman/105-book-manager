//
//  ColorExtension.swift
//  105-book-manager
//
//  Created by Samantha Roman on 11/5/25.
//

import SwiftUI
import UIKit

// Dont't explain this too much, just mention that this is used to express the color a base64 string.
// Only needed if adding
extension Color: RawRepresentable
{
    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else {
            self = .black
            return
        }
        
        do {
            if let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) {
                self = Color(color)
            } else {
                self = .black
            }
        } catch {
            self = .black
        }
    }
    
    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
}
