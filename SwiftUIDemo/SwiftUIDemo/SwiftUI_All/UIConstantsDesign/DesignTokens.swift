//
//  DesignTokens.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 09/03/26.
//

import SwiftUI

public struct DesignTokens {
    public let colors: DSColors.Type = DSColors.self
    public let typography: DSTypography.Type = DSTypography.self
    public let spacing: DSSpacing.Type = DSSpacing.self
}

// Enviornment Key for accessing design tokens
private struct DesignTokensKey: EnvironmentKey {
    static let defaultValue = DesignTokens()
}


public extension EnvironmentValues {
    var designTokens: DesignTokens {
        get { self[DesignTokensKey.self] }
        set { self[DesignTokensKey.self] = newValue }
    }
}
