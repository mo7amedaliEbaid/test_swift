//
//  Product.swift
//  test
//
//  Created by Macbook on 23/02/2025.
//

import Foundation

// MARK: - Product Model
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let price: Double
    let description: String
    let brand: String
    let model: String
    let color: String
    let category: String
    let discount: Int?
    let popular: Bool?
    let onSale: Bool?
    
    // Custom coding keys to handle the "onSale" property which might be named differently in JSON
    enum CodingKeys: String, CodingKey {
        case id, title, image, price, description, brand, model, color, category, discount, popular
        case onSale = "onSale"
    }
}

// MARK: - API Response Models
struct ProductsResponse: Codable {
    let status: String
    let message: String
    let products: [Product]
}

// MARK: - Single Product Response (for /products/{id} endpoint)
struct SingleProductResponse: Codable {
    let status: String
    let message: String
    let product: Product
} 