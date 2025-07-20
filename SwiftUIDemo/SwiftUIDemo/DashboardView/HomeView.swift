//
//  HomeView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 03/01/25.
//

import SwiftUI

struct HomeView: View {
    let items = Array(0...100)
    var body: some View {
        ScrollView{
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)){
                ForEach(items, id:\.self){ item in
                    if item == 10{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 200)
                            .overlay(Text(String(item)))
                    }else{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 100)
                            .overlay(Text(String(item)))
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
