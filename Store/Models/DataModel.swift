//
//  DataModel.swift
//  Store
//
//  Created by Sergio García on 10/11/25.
//

import SwiftUI
import Foundation

enum ProductCategory: String, Identifiable, Codable, CaseIterable {
    var id: String { self.rawValue }
    case all = "all"
    case beauty
    case fragrances
    case furniture
    case groceries
    case laptops
    case homeDecoration = "home-decoration"
    case kitchenAccessories = "kitchen-accessories"
    case mensShirts = "mens-shirts"
    case mensShoes = "mens-shoes"
    case mensWatches = "mens-watches"
    case mobileAccessories = "mobile-accessories"
    
    // Icono SF Symbol
    var icon: String {
        switch self {
        case .all:
            return "rectangle.stack"
        case .beauty:
            return "sparkles"
        case .fragrances:
            return "drop.fill"
        case .furniture:
            return "sofa.fill"
        case .groceries:
            return "cart.fill"
        case .laptops:
            return "laptopcomputer"
        case .homeDecoration:
            return "paintbrush.fill"
        case .kitchenAccessories:
            return "fork.knife"
        case .mensShirts:
            return "tshirt.fill"
        case .mensShoes:
            return "shoe.fill"
        case .mensWatches:
            return "watch.analog"
        case .mobileAccessories:
            return "iphone.gen3"
        }
    }
    
    // Color representativo
    var color: Color {
        switch self {
        case .all:
            return .primary
        case .beauty:
            return .pink
        case .fragrances:
            return .purple
        case .furniture:
            return .brown
        case .groceries:
            return .orange
        case .laptops:
            return .blue
        case .homeDecoration:
            return .indigo
        case .kitchenAccessories:
            return .red
        case .mensShirts:
            return .cyan
        case .mensShoes:
            return .gray
        case .mensWatches:
            return .yellow
        case .mobileAccessories:
            return .green
        }
    }
    
    // Nombre legible para mostrar
    var displayName: String {
        switch self {
        case .all:
            return "All"
        case .beauty:
            return "Beauty"
        case .fragrances:
            return "Fragrances"
        case .furniture:
            return "Furniture"
        case .groceries:
            return "Groceries"
        case .laptops:
            return "Laptops"
        case .homeDecoration:
            return "Home Decoration"
        case .kitchenAccessories:
            return "Kitchen Accessories"
        case .mensShirts:
            return "Men's Shirts"
        case .mensShoes:
            return "Men's Shoes"
        case .mensWatches:
            return "Men's Watches"
        case .mobileAccessories:
            return "Mobile Accessories"
        }
    }
}


struct Product: Identifiable, Hashable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: ProductCategory
    let images: [String]
    let thumbnail: String
    
}

struct Catalog: Hashable, Codable {
    var products: [Product]
}

extension Product {
    static let productTest = Product(id: 1, title: "Essence Mascara Lash Princess", price: 9.99, description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.", category: .beauty, images: ["https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"], thumbnail: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp")
}

