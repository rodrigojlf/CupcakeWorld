//
//  ProductDetailsHeroImageView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 29/03/26.
//

import SwiftUI

struct ProductDetailsHeroImageView: View {
    let imageUrl: String
    
    var body: some View {
        Rectangle()
            .fill(Color.pink.opacity(0.1))
            .frame(height: 350)
            .overlay(
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 350)
                            .clipped()
                    } else if phase.error != nil {
                        Image(systemName: "birthday.cake.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .foregroundColor(.pink.opacity(0.5))
                    } else {
                        ProgressView()
                    }
                })
            .overlay(alignment: .bottom) {
                LinearGradient(
                    colors: [.clear, Color(.systemBackground)],
                    startPoint: .center,
                    endPoint: .bottom
                )
                .frame(height: 100)
            }
    }
}
