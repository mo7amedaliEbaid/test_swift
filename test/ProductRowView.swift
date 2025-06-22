//
//  ProductRowView.swift
//  test
//
//  Created by Macbook on 23/02/2025.
//

import SwiftUI

// MARK: - Product Row View
struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 12) {
            // Product Image
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            .clipped()
            
            // Product Details
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(.primary)
                
                Text(product.brand)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    // Discount badge if available
                    if let discount = product.discount {
                        Text("\(discount)% OFF")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.red)
                            .cornerRadius(4)
                    }
                }
                
                // Popular badge if available
                if let popular = product.popular, popular {
                    Text("POPULAR")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.orange)
                        .cornerRadius(4)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ProductRowView(product: Product(
        id: 1,
        title: "Sample Product",
        image: "https://example.com/image.jpg",
        price: 99.99,
        description: "Sample description",
        brand: "Sample Brand",
        model: "Sample Model",
        color: "Black",
        category: "Electronics",
        discount: 10,
        popular: true,
        onSale: false
    ))
    .padding()
} 