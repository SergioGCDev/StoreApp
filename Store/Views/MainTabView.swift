    //
    //  MainTabView.swift
    //  Store
    //
    //  Created by Sergio García on 20/11/25.
    //

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0 // ← Control de pestaña seleccionada
    @StateObject private var vm = ProductVM() // ← ViewModel compartido
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house.fill", value: 0) {
                ContentView()
            }
            
            Tab("Favorite", systemImage: "star.fill", value: 1) {
                FavoritesView(selectedTab: $selectedTab)
                    .badge(5)
            }
            
            Tab("Cart", systemImage: "cart.fill", value: 2) {
                CartView(selectedTab: $selectedTab)
                    // .badge(vm.cartItemsCount)
            }
            
        }
        .environmentObject(vm)
    }
}


#Preview {
    MainTabView()
    .environmentObject(ProductVM())
}
