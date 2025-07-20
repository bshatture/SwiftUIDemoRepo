//
//  DashboardView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 03/01/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }
    var body: some View {
        TabView(selection: $selection){
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            Text("Settings View")
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(1)
            
            Text("Profile View")
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
            
            Text("Notification View")
                .tabItem{
                    Image(systemName: "bell")
                    Text("Notification")
                }
                .tag(3)
            
            Text("Help View")
                .tabItem{
                    Image(systemName: "questionmark")
                    Text("Help")
                        
                }
                .tag(4)
                
        }
        
    }
}

#Preview {
    DashboardView()
}
