//
//  ProductVM.swift
//  Store
//
//  Created by Sergio García on 11/11/25.
//

import SwiftUI
import Combine

final class ProductVM: ObservableObject {
    @Published var products: [Product] = []
    
    @Published private(set) var favoriteProducts: Set<Int> = []
    @Published var search = ""
    @Published var showOnlyFavorites: Bool = false
    
    private let repository: DataRepository
    
    var filteredProducts: [Product] {
            products.filter { product in
                // Condición 1: Búsqueda
                let matchesSearch = search.isEmpty ||
                                   product.title.range(
                                       of: search,
                                       options: [.caseInsensitive, .diacriticInsensitive]
                                   ) != nil
                
                // Condición 2: Favoritos
                let matchesFavorites = !showOnlyFavorites || isFavorite(product)
                
                // Ambas deben cumplirse
                return matchesSearch && matchesFavorites
            }
        }
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.products = try repository.load()
        } catch {
            self.products = []
            print(error)
        }
    }
    
    
    func toggleFavorite(product: Product) {
        if favoriteProducts.contains(product.id) {
            favoriteProducts.remove(product.id)
        } else {
            favoriteProducts.insert(product.id)
        }
    }
    
    func isFavorite(_ product: Product) -> Bool {
        favoriteProducts.contains(product.id)
    }
}
