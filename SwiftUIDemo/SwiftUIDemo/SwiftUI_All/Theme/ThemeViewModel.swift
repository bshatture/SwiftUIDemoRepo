//
//  ThemeViewModel.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 04/03/26.
//

import SwiftUI

// Toggle themes dynamically
@Observable
class ThemeViewModel {
    var currentTheme = ThemeManager.light
    
    func switchToTheme(_ theme: AppTheme) {
        currentTheme = theme
    }
}
