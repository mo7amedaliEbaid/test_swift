//
//  ProductDetailView.swift
//  test
//
//  Created by Macbook on 23/02/2025.
//

import SwiftUI

// MARK: - Product Detail View
struct ProductDetailView: View {
    let product: Product
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product Image
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                                .font(.system(size: 50))
                        )
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 16) {
                    // Title and Price
                    VStack(alignment: .leading, spacing: 8) {
                        Text(product.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        HStack {
                            Text("$\(String(format: "%.2f", product.price))")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            
                            Spacer()
                            
                            // Badges
                            HStack(spacing: 8) {
                                if let discount = product.discount {
                                    Text("\(discount)% OFF")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.red)
                                        .cornerRadius(6)
                                }
                                
                                if let popular = product.popular, popular {
                                    Text("POPULAR")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.orange)
                                        .cornerRadius(6)
                                }
                                
                                if let onSale = product.onSale, onSale {
                                    Text("ON SALE")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.green)
                                        .cornerRadius(6)
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    // Product Details
                    VStack(alignment: .leading, spacing: 12) {
                        DetailRow(title: "Brand", value: product.brand)
                        DetailRow(title: "Model", value: product.model)
                        DetailRow(title: "Color", value: product.color.capitalized)
                        DetailRow(title: "Category", value: product.category.capitalized)
                    }
                    
                    Divider()
                    
                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(product.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineLimit(nil)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

// MARK: - Detail Row Helper View
struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .frame(width: 80, alignment: .leading)
            
            Text(value)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

#Preview {
    NavigationView {
        ProductDetailView(product: Product(
            id: 1,
            title: "Sample Product with a very long title that might wrap to multiple lines",
            image: "https://example.com/image.jpg",
            price: 99.99,
            description: "This is a detailed description of the product that provides comprehensive information about its features, specifications, and benefits. It should be long enough to demonstrate how the text wrapping works in the detail view.",
            brand: "Sample Brand",
            model: "Sample Model",
            color: "Black",
            category: "Electronics",
            discount: 10,
            popular: true,
            onSale: false
        ))
    }
} 