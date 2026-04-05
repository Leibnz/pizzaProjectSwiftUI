//
//  CategoryView.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 04.04.2026.
//

import SwiftUI

struct CategoryView: View {
    
    @Binding var selectedCategory: ProductCategory?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(ProductCategory.allCases, id: \.self) { category in
                    CategoryButton(title: category.title, isSelected: selectedCategory == category) {
                        selectedCategory = category
                    }
                }
            }
            
            .padding(.horizontal)
        }
    }
}

struct CategoryButton: View {
    
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(Color.black)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.orange.opacity(0.2) : Color.gray.opacity(0.1))
                )
                .foregroundColor(isSelected ? .white : .black)
        }
    }
}
