//
//  ProductCardView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 10/03/26.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: product.image))
                .frame(height: 300)
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            Text("\(product.category)")
                
            Text("\(product.name)")
                .font(.largeTitle)
            Text("\(product.price)")
        }
    }
}
