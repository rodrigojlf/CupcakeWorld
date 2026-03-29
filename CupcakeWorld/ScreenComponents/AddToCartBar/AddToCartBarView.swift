//
//  AddToCartBarView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 29/03/26.
//

import SwiftUI

struct AddToCartBarView: View {
    
    @Binding var totalPrice: Double
    @Binding var quantity: Int
    
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Total")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    if #available(iOS 17.0, *) {
                        Text(String(format: "R$ %.2f", totalPrice))
                            .font(.title2)
                            .fontWeight(.bold)
                            .contentTransition(.numericText(value: Double(quantity)))
                    } else {
                        Text(String(format: "R$ %.2f", totalPrice))
                            .font(.title2)
                            .fontWeight(.bold)
                            .contentTransition(.opacity)
                    }
                }
                .animation(.default, value: quantity)
                
                Spacer()
                
                Button(action: action) {
                    HStack {
                        Image(systemName: "cart.badge.plus")
                        Text("Adicionar")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(Color.pink)
                    .clipShape(Capsule())
                    .shadow(color: .pink.opacity(0.4), radius: 8, y: 4)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 10)
            .background(Color(.systemBackground))
        }
    }
}

struct AddToCartBarView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State private var quantity = 1
        @State private var totalPrice = 10.0
        var body: some View {
            AddToCartBarView(totalPrice: $totalPrice,
                             quantity: $quantity) {}
                .padding()
        }
    }
}
