//
//  HomeCreateYourOwnView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 22/03/26.
//

import SwiftUI

struct HomeCreateYourOwnView: View {
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button(action: action) {
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Do seu jeito ✨")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Escolha a massa, o recheio e a cobertura. Você é o chef!")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    Image(systemName: "wand.and.stars")
                        .font(.system(size: 40, weight: .light))
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(-15))
                }
                .padding(20)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.pink, Color.orange.opacity(0.8)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(16)
                .shadow(color: .pink.opacity(0.4), radius: 8, x: 0, y: 6)
            }
            .buttonStyle(PlainButtonStyle())
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Criar cupcake do seu jeito. Escolha massa, recheio e cobertura.")
            .accessibilityAddTraits(.isButton)
        }
        .padding()
    }
}

#Preview {
    HomeCreateYourOwnView() {
        print("Clicou no botão")
    }
}
