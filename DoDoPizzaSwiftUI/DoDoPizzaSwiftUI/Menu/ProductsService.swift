//
//  ProductsService.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 18.03.2026.
//

import Foundation

protocol IProductsService {
    func fetchProducts() async throws -> [Product]
}

//struct ProductsService: IProductsService {
//
//    var products = [
//        Product(id: 1, name: "Пепперони", description: "Сыр, колбаса", price: 420, image: "pepperoni"),
//        Product(id: 2, name: "4 Сыра", description: "4 разных сыра", price: 650, image: "margarita"),
//        Product(id: 3, name: "Чикен", description: "Курица, сыр, помидоры", price: 340, image: "chickenRanchPizza")
//    ]
//    
//    func fetchProducts() -> [Product] {
//        return products
//    }
//}

final class ProductsService: IProductsService {
    
    private let urlProducts = "http://localhost:3001/products"
    
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: urlProducts) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else { throw URLError(.badServerResponse) }
        
        do {
            let products = try JSONDecoder().decode([Product].self, from: data)
            return products
        } catch {
            throw error
        }
    }
}
