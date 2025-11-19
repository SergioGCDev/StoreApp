    //
    //  DetailView.swift
    //  Store
    //
    //  Created by Sergio García on 12/11/25.
    //

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var vm: ProductVM
    
    var product: Product
    
    @State var primaryImage: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(uiColor: .systemBackground),
                    Color(uiColor: .systemGroupedBackground)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                AsyncImage(url: URL(string: primaryImage != "" ? primaryImage : product.thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                } placeholder: {
                    ProgressView()
                }
                .overlay(alignment: .topTrailing) {
                    // Precio
                    Text(product.price, format: .currency(code: "USD"))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background {
                            Capsule()
                                .fill(.blue.gradient)
                                .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
                        }
                        .padding(12)
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(product.images, id: \.self){ image in
                            Button {
                                primaryImage = image
                            } label: {
                                AsyncImage(url: URL(string: image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 80)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            
                        }
                    }
                }
                Section {
                    VStack(alignment: .leading, spacing: 15) {
                        
                            // Description
                        VStack(alignment: .leading, spacing: 10) {
                            Label("Description", systemImage:"book")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Text(product.description)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Divider()
                            // Category
                        VStack(alignment: .leading, spacing: 10) {
                            Label("Category", systemImage: product.category.icon)
                                .font(.headline)
                                .foregroundStyle(product.category.color)
                            Text(product.category.rawValue.capitalized)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                } header: {
                    Text("Product Information")
                        .textCase(.uppercase)
                        .font(.title2)
                        .bold()
                }
                
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(uiColor: .secondarySystemGroupedBackground))
                }
            }
            .fontWidth(.compressed)
            .navigationTitle(product.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    FavToolBar(product: product)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(product: .productTest)
            .environmentObject(ProductVM(repository: RepositoryTest()))
    }
}
