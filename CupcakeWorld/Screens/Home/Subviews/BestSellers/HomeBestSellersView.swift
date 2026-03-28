//
//  HomeBestSellersView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 22/03/26.
//

import SwiftUI

struct HomeBestSellersView: View {
    let cupcakes: [Cupcake]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Os Mais Pedidos 🧁")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(cupcakes) { cupcake in
                        NavigationLink {
                            ProductDetailsView(cupcake: cupcake)
                        } label: {
                            CupcakeGridItemView(cupcake: cupcake)
                                .frame(width: 150)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeBestSellersView(cupcakes: Mock().cupcakes)
}
