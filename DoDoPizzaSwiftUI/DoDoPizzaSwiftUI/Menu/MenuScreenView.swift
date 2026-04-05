//
//  ContentView.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 18.03.2026.
//

import SwiftUI

struct MenuScreenView: View {
    
    @StateObject private var viewModel = MenuViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                VStack {
                    Text("Ошибка: \(error)")
                    
                    Button("Повторить") {
                        Task {
                            await viewModel.loadProducts()
                        }
                    }
                }
            } else {
                VStack {
                    
                    CategoryView(selectedCategory: $viewModel.selectedCategory)
                    
                    List(viewModel.filteredProducts) { product in
                        Button {
                            path.append(product)
                        } label: {
                            MenuCellView(product: product)
                        }
                        .buttonStyle(.plain)
                    }
                    .listStyle(.plain)
                }
                .navigationDestination(for: Product.self) { product in
                    DetailScreenView(product: product)
                }
            }
        }
        .task {
            await viewModel.loadProducts()
        }
    }
}


#Preview {
    MenuScreenView()
}
