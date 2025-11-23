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
                .swipeActions(edge: .leading) {
                    SwipeFav(product: product)
                }
                
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .navigationTitle("Product list")
            .navigationDestination(for: Product.self) { product in
                DetailView(product: product)
            }
            .searchable(
                text: $vm.search,
                isPresented: $searchPresent,
                placement: .toolbar,
                prompt: Text("Type to search product")
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker("Select category", selection: $vm.selectedCategory) {
                            ForEach(vm.allCategories) { category in
                                Label {
                                    Text(category.displayName)
                                } icon: {
                                    Image(systemName: category.icon)
                                }
                                .tag(category)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(.menu)
                }
            }
        }
    }
}




#Preview {
    ContentView()
        .environmentObject(ProductVM(repository: Repository()))
}


//
//struct ContentView: View {
//    
//    @EnvironmentObject var vm: ProductVM
//    @State private var searchPresent: Bool = false
//    
//    var body: some View {
//        NavigationStack {
//            List(vm.filteredProducts) { product in
//                NavigationLink(value: product) {
//                    ProductRow(product: product)
//                }
//                .swipeActions(edge: .leading) {
//                    SwipeFav(product: product)
//                }
//                
//                .listRowSeparator(.hidden)
//            }
//            .listStyle(.inset)
//            .navigationTitle("Product list")
//            .navigationDestination(for: Product.self) { product in
//                DetailView(product: product)
//            }
//            .searchable(
//                text: $vm.search,
//                isPresented: $searchPresent,
//                placement: .toolbar,
//                prompt: Text("Type to search product")
//            )
//            .toolbar {
//                ToolbarItemGroup(placement: .topBarTrailing) {
//                    Picker("Select category", selection: $vm.selectedCategory) {
//                            ForEach(vm.allCategories) { category in
//                                Label {
//                                    Text(category.displayName)
//                                } icon: {
//                                    Image(systemName: category.icon)
//                                }
//                                .tag(category)
//                            }
//                        }
//                        .labelsHidden()
//                        .pickerStyle(.menu)
//                    Button {
//                        vm.showOnlyFavorites.toggle()
//                    } label: {
//                        Image(systemName: vm.showOnlyFavorites ? "bookmark.fill" :"bookmark")
//                            .foregroundStyle(vm.showOnlyFavorites ? .yellow : .primary)
//                    }
//                }
//            }
//        }
//    }
//}
