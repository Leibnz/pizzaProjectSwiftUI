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
