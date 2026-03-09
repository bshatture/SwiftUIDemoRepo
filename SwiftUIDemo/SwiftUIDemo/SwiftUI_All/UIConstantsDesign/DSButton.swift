//
//  Button.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 09/03/26.
//

import SwiftUI

public struct DSButton: View {
    
    public var body: some View{
        Button(action: action) {
            HStack {
                if isloading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(0.8)
                }
                
                Text(title)
                    .font(fontForSize)
                    .fontWeight(fontWeightForStyle)
            }
            .foregroundColor(foregroundColor)
            .padding(paddingForSize)
            .background(backgroundColor)
            .cornerRadius(conrnerRadiusForSize)
        }
        .disabled(isloading)
        .opacity(isloading ? 0.6 : 1.0)
        // Accessibility
        .accessibilityLabel(title)
        .accessibilityValue(isloading ? "Loading" : "")
        .accessibilityHint(isloading ? "Please wait" : "")
        .accessibilityAddTraits(.isButton)
    }
    
    public enum Style {
        case primary
        case secondary
        case destructive
        case ghost
    }
    
    public enum Size {
        case small
        case medium
        case large
    }
    
    private let title: String
    private let style: Style
    private let size: Size
    private let isloading: Bool
    private let action: () -> Void
    
    public init(title: String, style: Style, size: Size, isloading: Bool, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.size = size
        self.isloading = isloading
        self.action = action
    }
}

// ------------------------------------------------------

private extension DSButton {
    var fontForSize: Font {
        switch size {
        case .small: return DSTypography.labelMedium
        case .medium: return DSTypography.labelLarge
        case .large: return DSTypography.bodyLarge
        }
    }
    
    var fontWeightForStyle: Font.Weight {
        switch style {
        case .primary, .destructive: return .semibold
        case .secondary, .ghost: return .medium
        }
    }
    
    var foregroundColor: Color {
        switch style {
        case .primary: return DSColors.onPrimary
        case .secondary: return DSColors.primary
        case .destructive: return DSColors.onPrimary
        case .ghost: return DSColors.primary
        }
    }
    
    var backgroundColor: Color {
        switch style {
        case .primary: return DSColors.primary
        case .secondary: return DSColors.surface
        case .destructive: return DSColors.error
        case .ghost: return Color.clear
        }
    }
}

// ----------------------------------------------------

private extension DSButton {
    var paddingForSize: EdgeInsets {
        switch size {
        case .small: return EdgeInsets(top: DSSpacing.sm, leading: DSSpacing.md, bottom: DSSpacing.sm, trailing: DSSpacing.md)
        case .medium: return EdgeInsets(top: DSSpacing.md, leading: DSSpacing.lg, bottom: DSSpacing.md, trailing: DSSpacing.lg)
        case .large: return EdgeInsets(top: DSSpacing.lg, leading: DSSpacing.xl, bottom: DSSpacing.lg, trailing: DSSpacing.xl)
        }
    }
    
    var conrnerRadiusForSize: CGFloat {
        switch size {
        case .small: return 6
        case .medium: return 8
        case .large: return 12
        }
    }
}

