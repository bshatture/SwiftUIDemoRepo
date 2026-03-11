//
//  ProductCatlougeView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 10/03/26.
//

import SwiftUI

struct ProductCatlougeView: View {
    
    @Namespace private var cardTransition
    
    let products = [
        Product(id: 1, name: "Wireless Headphones", price: "$299", image: "https://picsum.photos/id/96/300", category: "Audio"),
        Product(id: 2, name: "Smart Watch", price: "$399", image: "https://picsum.photos/id/119/300", category: "Wearables"),
        Product(id: 3, name: "Laptop Stand", price: "$89", image: "https://picsum.photos/id/48/300", category: "Accessaries"),
        Product(id: 4, name: "Bluetooth Speaker", price: "$149", image: "https://picsum.photos/id/155/300", category: "Audio")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(products) { product in
                        NavigationLink(value: product) {
                            ProductCardView(product: product)
                                .contentShape(Rectangle()) // This makes only the visible content tapable
                                .matchedTransitionSource(id: product.id, in: cardTransition)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Products")
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
                    .navigationTransition(.zoom(sourceID: product.id, in: cardTransition))
            }
        }
    }
}



struct Product: Identifiable, Hashable {
    var id: Int
    var name: String
    var price: String
    var image: String
    var category: String
}


#Preview {
    ProductCatlougeView()
}
