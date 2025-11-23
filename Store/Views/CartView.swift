//
//  FavoritesView 2.swift
//  Store
//
//  Created by Sergio García on 20/11/25.
//


//
//  FavoritesView.swift
//  Store
//
//  Created by Sergio García on 20/11/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var vm: ProductVM
    
    @Binding var selectedTab: Int

    
    var body: some View {
        VStack (alignment: .center){
            
                Spacer()
                Image(systemName: "cart.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(50)
                    .frame(height: 250)
                    .foregroundStyle(.primary.opacity(0.5))
                    .background(.mint.opacity(0.2))
                    .clipShape(.circle)
                Text("You don't have any items on cart yet. Add some one!")
                    .font(.headline)
                Spacer()
            
        }
        .navigationTitle("Cart")
    }
    
}

#Preview {
    @Previewable @State var selectedTab: Int = 0
    NavigationStack {
        CartView(selectedTab: $selectedTab)
            .environmentObject(ProductVM(repository: Repository()))
    }
}
