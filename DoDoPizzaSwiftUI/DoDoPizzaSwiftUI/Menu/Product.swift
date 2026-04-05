//
//  Product.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 18.03.2026.
//

import Foundation

struct Product: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let type: ProductCategory
    let description: String
    let price: Int
    let image: String
    let size: Int?
    let dough: String?
    let isPromo: Bool
    
    static var defaultProduct: Product {
        return Product(id: 1, name: "Pepperoni", type: .pizza, description: "Pepperoni pizza description", price: 100, image: "http://localhost:3003/images/Banners/pepperoniFresh", size: 30, dough: "traditional", isPromo: false)
    }
}

