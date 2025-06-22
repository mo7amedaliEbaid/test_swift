//
//  ProductsViewModel.swift
//  test
//
//  Created by Macbook on 23/02/2025.
//

import Foundation
import SwiftUI

// MARK: - Products ViewModel
@MainActor
class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var selectedProduct: Product?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showingError = false
    
    private let apiService = APIService.shared
    
    // MARK: - Load All Products
    func loadProducts() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let fetchedProducts = try await apiService.fetchProducts()
                products = fetchedProducts
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
                showingError = true
                isLoading = false
            }
        }
    }
    
    // MARK: - Load Single Product
    func loadProduct(id: Int) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let product = try await apiService.fetchProduct(id: id)
                selectedProduct = product
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
                showingError = true
                isLoading = false
            }
        }
    }
    
    // MARK: - Clear Error
    func clearError() {
        errorMessage = nil
        showingError = false
    }
} 