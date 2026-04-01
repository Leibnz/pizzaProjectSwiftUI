//
//  DetailScreenView.swift
//  DoDoPizzaSwiftUI
//
//  Created by Andrew on 18.03.2026.
//

import SwiftUI

struct DetailScreenView: View {
    
    let product: Product
    
    var body: some View {
        ScrollView {
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
                    Text(product.price, format: .currency(code: "RUB"))
                    
                }
                
                Spacer()
            }
            
            .padding(.vertical, 8)
        }
    }
}
