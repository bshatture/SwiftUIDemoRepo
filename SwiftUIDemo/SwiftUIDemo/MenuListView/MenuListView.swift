//
//  MenuListView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 31/12/24.
//

import SwiftUI

struct MenuListView: View {
    var menuList = MenuModel().menu
    var body: some View {
//        ListHeaderView(text: "Menu")
        List(menuList){ item in
            MeuRowView(menuItem: item)
                .listRowInsets(EdgeInsets())
        }
    }
}

#Preview {
    MenuListView()
}
