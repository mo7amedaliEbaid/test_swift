# Fake Store API iOS App

A simple iOS app built with SwiftUI that demonstrates how to fetch and display data from a REST API. This app uses the [Fake Store API](https://fakestoreapi.in/api/products) to display a list of products and their details.

## 🎯 Learning Objectives

This project demonstrates the following Swift and SwiftUI concepts:

### Architecture & Design Patterns
- **MVVM (Model-View-ViewModel)** pattern
- **Separation of Concerns** with dedicated service layers
- **ObservableObject** for reactive UI updates
- **@StateObject** and **@Published** for state management

### Networking
- **URLSession** with **async/await** for modern concurrency
- **JSON decoding** with **Codable** protocol
- **Error handling** with custom error types
- **Network security** configuration

### SwiftUI Features
- **NavigationView** and **NavigationLink** for navigation
- **AsyncImage** for loading remote images
- **LazyVStack** for efficient list rendering
- **Refreshable** modifier for pull-to-refresh
- **Alert** for error presentation
- **Toolbar** for navigation controls

### UI/UX Design
- **Loading states** with ProgressView
- **Empty states** with helpful messaging
- **Error states** with user-friendly alerts
- **Modern iOS design** patterns
- **Responsive layout** with proper spacing

## 📱 App Features

1. **Product List**: Displays all products from the API in a scrollable list
2. **Product Details**: Tap any product to see detailed information
3. **Pull to Refresh**: Swipe down to reload the product list
4. **Error Handling**: Graceful error handling with user-friendly messages
5. **Loading States**: Visual feedback during data loading
6. **Image Loading**: Asynchronous image loading with placeholders

## 🏗️ Project Structure

```
test/
├── testApp.swift              # Main app entry point
├── ContentView.swift          # Main view with product list
├── Product.swift              # Data model for products
├── APIService.swift           # Network service layer
├── ProductsViewModel.swift    # ViewModel for state management
├── ProductRowView.swift       # Reusable product row component
├── ProductDetailView.swift    # Product detail view
└── Info.plist                # App configuration
```

## 🔧 Key Components Explained

### 1. Product Model (`Product.swift`)
```swift
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let price: Double
    // ... other properties
}
```
- **Codable**: Enables JSON encoding/decoding
- **Identifiable**: Required for SwiftUI lists
- **Optional properties**: Handle missing data gracefully

### 2. API Service (`APIService.swift`)
```swift
class APIService {
    func fetchProducts() async throws -> [Product] {
        // Network request implementation
    }
}
```
- **Singleton pattern**: Shared instance across the app
- **async/await**: Modern concurrency for network calls
- **Error handling**: Custom error types for different scenarios

### 3. ViewModel (`ProductsViewModel.swift`)
```swift
@MainActor
class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    // ... state management
}
```
- **@MainActor**: Ensures UI updates happen on main thread
- **ObservableObject**: Enables SwiftUI binding
- **@Published**: Triggers UI updates when values change

### 4. Views
- **ContentView**: Main container with navigation and state management
- **ProductRowView**: Reusable component for list items
- **ProductDetailView**: Detailed product information display

## 🚀 How to Run

1. Open the project in Xcode
2. Select your target device (iPhone Simulator or physical device)
3. Press `Cmd + R` to build and run
4. The app will automatically load products from the API

## 📚 API Endpoints Used

1. **GET /api/products** - Fetches all products
2. **GET /api/products/{id}** - Fetches a specific product by ID

## 🎨 UI Features

### Product List
- Clean, modern design with product images
- Price and discount badges
- Popular product indicators
- Smooth scrolling with lazy loading

### Product Details
- Large product image
- Comprehensive product information
- Price and promotional badges
- Full product description
- Custom navigation with back button

### Loading & Error States
- Loading spinner during data fetch
- Empty state with call-to-action
- Error alerts with retry options
- Pull-to-refresh functionality

## 🔍 Learning Concepts Demonstrated

### SwiftUI State Management
- **@StateObject**: Creates and owns the ViewModel
- **@Published**: Properties that trigger UI updates
- **@Environment**: Access to system values like dismiss

### Modern Swift Features
- **async/await**: Simplified asynchronous programming
- **Codable**: Automatic JSON serialization
- **Result types**: Better error handling
- **Property wrappers**: @StateObject, @Published, etc.

### iOS Development Best Practices
- **Error handling**: Comprehensive error management
- **Loading states**: User feedback during operations
- **Accessibility**: Proper semantic markup
- **Performance**: Lazy loading and efficient rendering

## 🛠️ Customization Ideas

1. **Add search functionality** to filter products
2. **Implement favorites** with local storage
3. **Add shopping cart** functionality
4. **Implement categories** filtering
5. **Add product reviews** and ratings
6. **Implement offline caching** with Core Data

## 📖 Additional Resources

- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [URLSession Documentation](https://developer.apple.com/documentation/foundation/urlsession)
- [Codable Documentation](https://developer.apple.com/documentation/swift/codable)
- [MVVM Pattern Guide](https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app)

## 🤝 Contributing

Feel free to fork this project and experiment with different features or improvements. This is a learning project, so any enhancements are welcome!

---

**Happy Coding! 🚀** 