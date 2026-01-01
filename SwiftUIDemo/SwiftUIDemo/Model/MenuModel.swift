//
//  MenuModel.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 31/12/24.
//

import Foundation

struct MenuItem: Identifiable{
    var id: Int
    var name: String
    var description: String
    var price: Double
    var rating: Int
}

let testMenuItem = MenuItem(id: 0, name: "Huli Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 6)

struct MenuModel{
    var menu:[MenuItem] = [
        MenuItem(id: 1, name: "Desi Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 3),
        MenuItem(id: 2, name: "Tandoor Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 2),
        MenuItem(id: 3, name: "kadai Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 6),
        MenuItem(id: 4, name: "kabab Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 5),
        MenuItem(id: 5, name: "lolipop Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 1),
        MenuItem(id: 6, name: "Hybrid Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 4),
        MenuItem(id: 9, name: "curry Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 6),
        MenuItem(id: 7, name: "gavti Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 6),
        MenuItem(id: 8, name: "fryed Chikan", description: "Our original hawaiian street food pizza, with huli huli chiken, onions, ginger, crushed macadamia nuts, tomato auce, and cheese on a classic crust.", price: 14.00, rating: 6)
        
    ]
}

