//
//  ContentView1.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 01/01/25.
//

import SwiftUI

struct ContentView1: View {
    @State var isMenuDisplayed: Bool = true
    var body: some View {
        VStack{
//            ContentHeaderView()
//            .layoutPriority(2)
            Button(action: {self.isMenuDisplayed.toggle()}){
//                PageTitleView(title: "Order Pizza",
//                              isDisplayingOrders: isMenuDisplayed)
            }
            MenuListView()
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
//            OrderListView()
//                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
        }
        .padding()
    }
}

#Preview {
    ContentView1()
}
