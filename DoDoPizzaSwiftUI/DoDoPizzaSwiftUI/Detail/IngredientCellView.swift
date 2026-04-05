//
//  IngredientCellView.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 01.04.2026.
//

import SwiftUI

struct IngredientCellView: View {
    
    let ingredient: Ingredient
    
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: ingredient.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            } placeholder: {
                ProgressView()
                    .scaleEffect(2)
            }
            
            Text(ingredient.name)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
            
            Text("\(ingredient.price) ₽")
                .font(.system(size: 16, weight: .bold))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(RoundedRectangle(cornerRadius: 16)
            .fill(Color(.systemGray6)))
    }
}
