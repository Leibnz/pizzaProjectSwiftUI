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
    let type: String
    let description: String
    let price: Int
    let image: String
    let size: Int?
    let dough: String?
    let isPromo: Bool
}
