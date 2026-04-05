//
//  ProductCategory.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 04.04.2026.
//

import Foundation

enum ProductCategory: String, CaseIterable, Decodable, Hashable {
    case pizza = "pizza"
    case combo = "combo"
    case snacks = "snacks"
    case cocktails = "cocktails"
    case coffee = "coffee"
    case drinks = "drinks"
    case sauces = "sauces"
    
    var title: String {
        switch self {
        case .pizza: return "Пиццы"
        case .combo: return "Комбо"
        case .snacks: return "Закуски"
        case .cocktails: return "Коктейли"
        case .coffee: return "Кофе"
        case .drinks: return "Напитки"
        case .sauces: return "Соусы"
        }
    }
}
