//
//  AddressListItemView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 17/03/26.
//

import SwiftUI

struct AddressListItemView: View {
    let address: Address
    let isActive: Bool
    let onActivate: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
                onActivate()
            } label: {
                Image(systemName: isActive ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(isActive ? .pink : .gray)
                    .font(.title2)
            }
            .accessibilityLabel(isActive ? "Endereço selecionado" : "Selecionar este endereço")
            
            VStack(alignment: .leading, spacing: 4) {
                if let name = address.name, !name.isEmpty {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                Text(address.wrappedAddressShort)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(address.city), \(address.state)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    AddressListItemView(address: Mock().user.addresses.first!,
                        isActive: true,
                        onActivate: {})
}
