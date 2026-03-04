//
//  ThemeManager.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 04/03/26.
//

import SwiftUI

struct AppTheme {
    let primaryColor: Color
    let secondaryColor: Color
    let backgroundColor: Color
    let textColor: Color
    let font: Font
}


struct ThemeManager {
    static let light = AppTheme(
        primaryColor: .blue,
        secondaryColor: .gray,
        backgroundColor: .white,
        textColor: .black,
        font: .body
    )
    
    static let dark = AppTheme(
        primaryColor: .orange,
        secondaryColor: .gray,
        backgroundColor: .black,
        textColor: .white,
        font: .body
    )
    
    static let unicorn = AppTheme(
        primaryColor: .purple,
        secondaryColor: .pink,
        backgroundColor: Color(red: 0.95, green: 0.9, blue: 1.0),
        textColor: .purple,
        font: .title2
    )
}


private struct ThemeKey: EnvironmentKey {
    static let defaultValue = ThemeManager.unicorn
}

extension EnvironmentValues {
    var CustomThemeByBH: AppTheme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

