//
//  CupcakeGridItemView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 26/03/26.
//

import SwiftUI

struct CupcakeGridItemView: View {
    let cupcake: Cupcake
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.15))
                .scaledToFit()
                .overlay(alignment: .center) {
                    AsyncImage(url: URL(string: cupcake.imageUrl)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .clipped()
                        } else if phase.error != nil {
                            Image(systemName: "birthday.cake")
                        } else {
                            ProgressView()
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cupcake.name)
                    .foregroundStyle(.primary)
                    .tint(.primary)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(minHeight: 40, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                
                Text(String(format: "R$ %.2f", cupcake.price))
                    .font(.headline)
                    .foregroundStyle(.pink)
            }
            
            Spacer(minLength: 0)
            
            Text("Adicionar")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(Color.pink)
                .cornerRadius(8)
        }
        .frame(maxHeight: .infinity)
        .padding(12)
        .background(.thinMaterial)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CupcakeGridItemView(cupcake: Mock().cupcakes.first!)
}
