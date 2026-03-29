//
//  QuantitySelector.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 29/03/26.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    
    var body: some View {
        HStack {
            Text("Quantidade")
                .font(.headline)
            
            Spacer()
            
            HStack(spacing: 20) {
                Button {
                    if quantity > 1 {
                        quantity -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(quantity > 1 ? .primary : Color.gray.opacity(0.5))
                        .frame(width: 35, height: 35)
                        .background(Color.gray.opacity(0.1), in: Circle())
                }
                .disabled(quantity <= 1)
                
                if #available(iOS 17.0, *) {
                    Text("\(quantity)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 30)
                        .contentTransition(.numericText(value: Double(quantity)))
                } else {
                    Text("\(quantity)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 30)
                        .contentTransition(.opacity)
                }
                
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 35, height: 35)
                        .background(Color.pink, in: Circle())
                }
            }
            .animation(.default, value: quantity)
        }
        .padding(.vertical, 10)
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State private var quantity = 1
        var body: some View {
            QuantitySelector(quantity: $quantity)
                .padding()
        }
    }
}
