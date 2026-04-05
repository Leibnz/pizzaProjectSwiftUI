//
//  DetailScreenView.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 18.03.2026.
//

import SwiftUI

struct DetailScreenView: View {
    
    @State private var selectedSize = 0
    @State private var selectedDough = 1
    
    let ingredients: [Ingredient] = []
    let product: Product
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                        .scaleEffect(2)
                }
                .frame(width: 300, height: 300)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.name)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(product.description)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Picker("", selection: $selectedSize) {
                    Text("20 см").tag(0)
                    Text("25 см").tag(1)
                    Text("30 см").tag(2)
                    Text("35 см").tag(3)
                }
                .pickerStyle(.segmented)
                
                Picker("", selection: $selectedDough) {
                    Text("Традиционное").tag(0)
                    Text("Тонкое").tag(1)
                }
                .pickerStyle(.segmented)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(ingredients) { ingredient in
                        IngredientCellView(ingredient: ingredient)
                    }
                }
            }
        }
        
        .padding(.vertical, 8)
    }
}

#Preview {
    DetailScreenView(product: Product.defaultProduct)
}
