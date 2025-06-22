//
//  APIService.swift
//  test
//
//  Created by Macbook on 23/02/2025.
//

import Foundation

// MARK: - API Service
class APIService {
    static let shared = APIService()
    private let baseURL = "https://fakestoreapi.in/api"
    
    private init() {}
    
    // MARK: - Fetch All Products
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "\(baseURL)/products") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let productsResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
            return productsResponse.products
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    // MARK: - Fetch Single Product
    func fetchProduct(id: Int) async throws -> Product {
        guard let url = URL(string: "\(baseURL)/products/\(id)") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let productResponse = try JSONDecoder().decode(SingleProductResponse.self, from: data)
            return productResponse.product
        } catch {
            throw APIError.decodingError(error)
        }
    }
}

// MARK: - API Errors
enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .decodingError(let error):
            return "Failed to decode data: \(error.localizedDescription)"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
} 