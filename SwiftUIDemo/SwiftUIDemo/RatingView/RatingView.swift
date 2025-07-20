//
//  RatingView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 31/12/24.
//

import SwiftUI

struct RatingView: View {
    var count: Int = 4
    var rating: [String]{
        let symbolName = "\(count).circle"
        return Array(repeating: symbolName, count: count)
    }
    
    var body: some View {
        HStack{
            ForEach(rating, id:\.self) { item in
                Image(systemName: item)
//                    .font(.headline)
                    .font(.largeTitle)
//                    .foregroundColor(Color("G4"))
            }
        }
    }
}

#Preview {
    RatingView()
}
