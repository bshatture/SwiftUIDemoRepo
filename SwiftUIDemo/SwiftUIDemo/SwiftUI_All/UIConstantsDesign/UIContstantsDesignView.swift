//
//  UIContstantsDesignView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 09/03/26.
//

import SwiftUI

struct UIContstantsDesignView: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: DSSpacing.lg) {
            DSButton(title: "Primary Button", style: .primary, size: .medium, isloading: false) {
                print("Primary tapped")
            }
            
            DSButton(title: "Secondary Button", style: .primary, size: .medium, isloading: false){
                print("Secondary tapped")
            }
            
            DSButton(title: "Loading Button", style: .primary, size: .medium, isloading: isLoading) {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
            
            DSButton(title: "Small Destructive", style: .destructive, size: .small, isloading: false) {
                print("Delete tapped")
            }
        }
        .padding()
    }
}

#Preview {
    UIContstantsDesignView()
}
