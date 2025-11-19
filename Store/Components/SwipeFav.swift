//
//  SwipeActions.swift
//  Store
//
//  Created by Sergio García on 18/11/25.
//

import SwiftUI

struct SwipeFav: View {
    
    @EnvironmentObject var vm: ProductVM
    
    let product: Product
    
    var body: some View {
        
        Button {
            vm.toggleFavorite(product: product)
        } label: {
            if vm.isFavorite(product) {
                Label("Unfavorite", systemImage: "star.slash")
                    .tint(.black.opacity(0.5))
            } else {
                Label("Favorite", systemImage: "star")
                    .tint(.yellow)
            }
        }
    }
}


struct FavToolBar: View {
    @EnvironmentObject var vm: ProductVM
    let product: Product
    
    var body: some View {
        Button {
            vm.toggleFavorite(product: product)
        } label: {
            Image(systemName: vm.isFavorite(product) ? "bookmark.fill" : "bookmark")
                .foregroundStyle(vm.isFavorite(product) ? .yellow : .gray)  // ✅
        }
    }
}
                    
                    
#Preview {
    FavToolBar(product: .productTest)
        .environmentObject(ProductVM(repository: RepositoryTest()))
}
