//
//  FavoritesView.swift
//  Store
//
//  Created by Sergio García on 20/11/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var vm: ProductVM
    let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 2)
    @Binding var selectedTab: Int
    
    
    var body: some View {
        VStack (alignment: .center){
            if vm.allFavorites.isEmpty {
               ContentUnavailableView("You don't have any favorites yet. Add some one!", systemImage: "star.fill", description: Text("Swipe to right to add a product to your favorites."))
                Button {
                    selectedTab = 0
                } label: {
                    Text("Seguir comprando")
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)

            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(vm.allFavorites) { product in
                            NavigationLink(value: product) {
                                VStack(spacing: 8) {
                                    AsyncImage(url: URL(string: product.thumbnail)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 90)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(product.title)
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .frame(maxWidth: .infinity)
                                }
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationDestination(for: Product.self) { product in
            DetailView(product: product)
        }
        .navigationTitle("Favorites")
    }
    
}

#Preview {
    @Previewable @State var selectedTab = 0
    
    NavigationStack {
        FavoritesView(selectedTab: $selectedTab)
            .environmentObject(ProductVM(repository: Repository()))
    }
}
