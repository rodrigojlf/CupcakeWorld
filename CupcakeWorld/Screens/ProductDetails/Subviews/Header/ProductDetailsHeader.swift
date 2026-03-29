//
//  ProductDetailsHeader.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 29/03/26.
//

import SwiftUI

struct ProductDetailsHeader: View {
    
    @StateObject private var viewModel: ProductDetailsHeaderViewModel
        
        init(cupcake: Cupcake, user: User) {
            _viewModel = StateObject(wrappedValue: ProductDetailsHeaderViewModel(cupcake: cupcake, user: user))
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                ForEach(viewModel.cupcake.categories, id: \.self) { category in
                    Text(category.uppercased())
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundStyle(.pink)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.pink.opacity(0.15))
                        .clipShape(Capsule())
                }
                
                Spacer()
                
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundStyle(viewModel.isFavorite ? .red : .gray)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 30)
                        .font(.subheadline)
                        .onTapGesture {
                            viewModel.toggleFavorite()
                        }
                        .contentTransition(.opacity)
            }
            
            Text(viewModel.cupcake.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(viewModel.formattedPrice)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Sobre este cupcake")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(viewModel.cupcake.details)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
            }
        }
    }
}

#Preview {
    ProductDetailsHeader(cupcake: Mock().cupcakes.first!, user: Mock().user)
}
