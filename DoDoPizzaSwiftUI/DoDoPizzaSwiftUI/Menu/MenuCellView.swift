//
//  MenuCellView.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 18.03.2026.
//

import SwiftUI

struct MenuCellView: View {
    
    let product: Product
    
    var body: some View {
        HStack(spacing: 12) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Button {
                    
                    print("Кнопка нажата")
                    
                } label: {
                    Text(
                        product.price,
                        format: .currency(code: "RUB")
                            .precision(.fractionLength(0)))
                        .font(.body)
                        .foregroundStyle(.brown)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Capsule().fill(Color.orange).opacity(0.1))
                    
                }
                
                
                
            }
            
            Spacer()
        }
        
        .padding(.vertical, 6)
    }
}

#Preview {
    MenuScreenView()
}
