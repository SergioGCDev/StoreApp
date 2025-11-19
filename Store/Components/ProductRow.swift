//
//  ProductRow.swift
//  Store
//
//  Created by Sergio García on 17/11/25.
//
import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var vm: ProductVM
    
    let product: Product
    
    var body: some View {
        
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
            } placeholder: {
                ProgressView()
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(product.title)
                HStack {
                    if vm.isFavorite(product) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }

                    Text("$\(product.price, specifier: "%.2f")")
                }
                    // Acorta con specifier a 2 decimales
                
                
            }
        }
    }
}

#Preview {
    ProductRow(product: .productTest)
        .environmentObject(ProductVM(repository: RepositoryTest()))
}

