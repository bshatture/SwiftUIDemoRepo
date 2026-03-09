//
//  Colors.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 09/03/26.
//
import SwiftUI

public struct DSColors {
    // Semantic Colors - What they mean, not what they look like
    public static let primary = Color("Primary", bundle: .main)
    public static let secondary = Color("Secondary", bundle: .main)
    public static let accent = Color("Accent", bundle: .main)
    
    // System Colors - for different states and context
    public static let success = Color("Success", bundle: .main)
    public static let warning = Color("Warning", bundle: .main)
    public static let error = Color("Error", bundle: .main)
    
    // Surface Colors - For backgrounds and containers
    public static let background = Color("Background", bundle: .main)
    public static let surface = Color("Surface", bundle: .main)
    public static let surfaceVarient = Color("SurfaceVarient", bundle: .main)
    
    // Text Colors - redable on different backgrounds
    public static let onPrimary = Color("OnPrimary", bundle: .main)
    public static let onSurface = Color("OnSurface", bundle: .main)
    public static let onSurfaceSecondary = Color("OnSurfaceSecondary", bundle: .main)
}
