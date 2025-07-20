//
//  MeuRowView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 31/12/24.
//

import SwiftUI

struct MeuRowView: View {
    var menuItem: MenuItem = testMenuItem
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 15){
                Image("pizza")
                    .cornerRadius(10)
                    .border(Color("G4"), width: 2)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                VStack(alignment: .leading){
                    Text(menuItem.name)
                        .font(.title)
                        .fontWeight(.light)
                    RatingView(count: menuItem.rating)
                }
            }
            Text(menuItem.description)
        }
    }
}

#Preview {
    MeuRowView(menuItem: MenuModel().menu[7])
}
