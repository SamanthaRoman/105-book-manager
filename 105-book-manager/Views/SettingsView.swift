//
//  SettingsView.swift
//  105-book-manager
//
//  Created by Samantha Roman on 11/5/25.
//

import SwiftUI

struct SettingsView: View {
    
    //This 2 first in class
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = SETTINGS_THEME_DEFAULT_VALUE
    @AppStorage(SETTINGS_GRID_COLUMNS_KEY) private var gridColumns: Int = SETTINGS_GRID_COLUMNS_DEFAULT_VALUE
    
    //This is not required
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentTintColor: Color = SETTINGS_ACCENT_COLOR_DEFAULT_VALUE
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $currentTheme) {
                        ForEach(Theme.allCases, id:\.self) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
                    }
                    // NOT REQUIRED FOCUS IN THE OTHER 2
                    ColorPicker("Accent Color", selection: $accentTintColor)
                }
                Section(header: Text("Grid")){
                    Stepper("Columns: \(gridColumns)", value: $gridColumns, in:1...4)
                }
            }
        }
    }
}
