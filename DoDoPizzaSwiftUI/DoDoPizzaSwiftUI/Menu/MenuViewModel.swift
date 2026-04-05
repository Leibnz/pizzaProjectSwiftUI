//
//  MenuViewModel.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 18.03.2026.
//

import Foundation

@MainActor
final class MenuViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var selectedCategory: ProductCategory? = nil
    
    var filteredProducts: [Product] {
        guard let selectedCategory else {
            return products
        }
        
        return products.filter { $0.type == selectedCategory }
    }
    
    private let service: IProductsService
    
    init(service: IProductsService = ProductsService()) {
        self.service = service
    }
    
    func loadProducts() async {
        isLoading = true
        errorMessage = nil
        
        do {
            products = try await service.fetchProducts()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
