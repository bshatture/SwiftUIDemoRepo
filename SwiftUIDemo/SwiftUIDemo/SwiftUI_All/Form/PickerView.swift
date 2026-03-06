//
//  PickerView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 05/03/26.
//
import SwiftUI

struct PickerView: View {
    
    let colors = ["Red", "Green", "Blue", "Purple"]
    let sizes = ["Small", "Medium", "Large", "Extra Large"]
    @State private var selectedFruit = Fruit.apple
    @State private var selectedColor = "Red"
    @State private var selectedSize = "Small"
    
    var body: some View {
        Form {
            Section(header: Text("Preference")) {
                // enum based picker
                Picker("Choose Fruit", selection: $selectedFruit){
                    ForEach(Fruit.allCases) { fruit in
                        Text(fruit.displayName).tag(fruit)
                    }
                }
                
                // Segmented picker for few options
                Picker("Color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) { color in
                        Text(color).tag(color)
                    }
                }
                .pickerStyle(.segmented)
                
                // menu style for many options
                Picker("Size", selection: $selectedSize) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size).tag(size)
                    }
                }
                .pickerStyle(.menu)
            }
        }
    }
}


enum Fruit: String, Identifiable, CaseIterable {
    var id: String { self.rawValue }
    
    case apple, banana, orange, grape
    
    var displayName: String {
        switch self {
        case .apple: return "🍎 Apple"
        case .banana: return "🍌 Banana"
        case .orange: return "🍊 Orange"
        case .grape: return "🍇 Grape"
        }
    }
}


#Preview {
    PickerView()
}
