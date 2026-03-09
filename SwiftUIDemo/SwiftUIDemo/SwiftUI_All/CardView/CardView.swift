//
//  CardView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 04/03/26.
//

import SwiftUI

struct CardView: View {
    @Environment(\.designTokens) private var tokens
    
    var body: some View {
        VStack{
            Text("1234 5678 9101 1234")
                .font(tokens.typography.headLineLarge)
                .foregroundColor(tokens.colors.secondary)
                .padding(tokens.spacing.md)
            Text("Bhimashankar Hatture")
            HStack{
                Text("Expiry : ")
                Text("04/26")
            }
        }
    }
}

