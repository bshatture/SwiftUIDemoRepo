//
//  Typography.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 09/03/26.
//
import SwiftUI

public struct DSTypography {
    // Display Styles - for heroes and big statements
    public static let displayLarge = Font.largeTitle.weight(.bold)
    public static let displayMedium = Font.title.weight(.bold)
    public static let displaySmall = Font.title2.weight(.bold)
    
    // Headline Style - for section headers
    public static let headLineLarge = Font.title2.weight(.semibold)
    public static let headLineMedium = Font.title3.weight(.semibold)
    public static let headLineSmall = Font.headline.weight(.semibold)
    
    // Body Styles - for main content
    public static let bodyLarge = Font.body
    public static let bodyMedium = Font.callout
    public static let bodySmall = Font.caption
    
    // Label Styles - for UI elements
    public static let labelLarge = Font.callout.weight(.medium)
    public static let labelMedium = Font.caption.weight(.medium)
    public static let labelSmall = Font.caption2.weight(.medium)
}
