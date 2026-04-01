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
            Group {
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
                    List(viewModel.products) { product in
                        Button {
                            path.append(product)
                        } label: {
                            MenuCellView(product: product)
                        }
                        .buttonStyle(.plain)
                    }
                    .listStyle(.plain)
                    .ignoresSafeArea(edges: [.bottom, .leading, .trailing])
                    .navigationDestination(for: Product.self) { product in
                        DetailScreenView(product: product)
                    }
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
