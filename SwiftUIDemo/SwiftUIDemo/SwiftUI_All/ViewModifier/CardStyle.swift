//
//  CardStyle.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 04/03/26.
//

import SwiftUI

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxHeight: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.25)
            .background(
                Image("cardbackground")
                    .resizable()
                    .scaledToFill()
            )
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}


extension View {
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
}
