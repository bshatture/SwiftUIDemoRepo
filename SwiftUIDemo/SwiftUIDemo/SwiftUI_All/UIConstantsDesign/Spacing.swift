//
//  Spacing.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 09/03/26.
//

import SwiftUI

public struct DSSpacing {
    // Basic unit - everything derives from this
    private static let baseUnit: CGFloat = 4
    
    // Spacing scale - powers of our base unit
    public static let xs = baseUnit * 1 // 4pt
    public static let sm = baseUnit * 2 // 8pt
    public static let md = baseUnit * 4 // 16pt
    public static let lg = baseUnit * 6 // 24pt
    public static let xl = baseUnit * 8  // 32pt
    public static let xxl = baseUnit * 12 // 48pt
    public static let xxxl = baseUnit * 16 // 64pt
    
    // Semantic spacing - for specific usecases
    public static let buttonPadding = md
    public static let cardPadding = lg
    public static let sectionSpacing = xl
    public static let screenPadding = md
}
