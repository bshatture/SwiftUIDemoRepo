//
//  SwiftUIAllConceptView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 04/03/26.
//

import SwiftUI

struct SwiftUIAllConceptView: View {
    
    @Environment(\.CustomThemeByBH) var theme
    
    var body: some View {
        VStack{
            Text("SwiftUI cutom text")
                .foregroundColor(theme.textColor)
                .font(theme.font)
            
            Text("Custom Font")
                .font(Font.custom("AutumnRegular", size: 20, relativeTo: .headline))
            TextField("Custom TextField", text: .constant(""))
                .customProperties()
            
            Button("Custom Buttom") {
                
            }
            .buttonStyle(PrimaryButtonStyle())
            
        }
        .padding()
    }
}

#Preview {
    SwiftUIAllConceptView()
}
