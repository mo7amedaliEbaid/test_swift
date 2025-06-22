//
//  ContentView.swift
//  test
//
//  Created by Macbook on 23/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                if viewModel.isLoading && viewModel.products.isEmpty {
                    // Loading State
                    VStack(spacing: 16) {
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("Loading products...")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                } else if viewModel.products.isEmpty {
                    // Empty State
                    VStack(spacing: 16) {
                        Image(systemName: "bag")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("No Products Found")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Tap the refresh button to load products")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Load Products") {
                            viewModel.loadProducts()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    // Product List
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.products) { product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductRowView(product: product)
                                        .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Divider()
                                    .padding(.leading, 100)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.loadProducts()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.blue)
                    }
                    .disabled(viewModel.isLoading)
                }
            }
            .refreshable {
                viewModel.loadProducts()
            }
        }
        .alert("Error", isPresented: $viewModel.showingError) {
            Button("OK") {
                viewModel.clearError()
            }
        } message: {
            Text(viewModel.errorMessage ?? "An unknown error occurred")
        }
        .onAppear {
            if viewModel.products.isEmpty {
                viewModel.loadProducts()
            }
        }
    }
}

#Preview {
    ContentView()
}
