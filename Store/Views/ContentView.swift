    //
    //  ContentView.swift
    //  Store
    //
    //  Created by Sergio García on 10/11/25.
    //

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ProductVM
    @State private var searchPresent: Bool = false
    
    var body: some View {
        NavigationStack {
            List(vm.filteredProducts) { product in
                NavigationLink(value: product) {
                    ProductRow(product: product)
                }
                .swipeActions(edge: .trailing) {
                    SwipeFav(product: product)
                }
                
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .navigationTitle("Product list")
            .navigationDestination(for: Product.self) { product in
                DetailView(product: product)
            }
            .searchable(text: $vm.search,
                        isPresented: $searchPresent,
                        prompt: Text("Type to search product"))
            .toolbar {
                ToolbarItem {
                    Button {
                        vm.showOnlyFavorites.toggle()
                    } label: {
                        Image(systemName: vm.showOnlyFavorites ? "bookmark.fill" :"bookmark")
                            .foregroundStyle(vm.showOnlyFavorites ? .yellow : .black)
                    }

                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProductVM(repository: RepositoryTest()))
}
