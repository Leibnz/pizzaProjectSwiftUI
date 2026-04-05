//
//  Ingredient.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 01.04.2026.
//

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let price: Int
    let isSelected: Bool
}
