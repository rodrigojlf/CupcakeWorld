//
//  HomeHeaderView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 17/03/26.
//

import SwiftUI

struct HomeHeaderView: View {
    @StateObject private var user: User = Mock().user
    @State private var showAddressesSheet: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.pink)
                    Text("Entregar em")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text(user.activeAddress?.wrappedAddressShort ?? "Selecione um endereço")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .accessibilityElement(children: .combine)
            .onTapGesture {
                showAddressesSheet = true
            }
            .sheet(isPresented: $showAddressesSheet) {
                AddressListView(user: user)
            }
            
            Spacer()
            
            //TODO - adjust Image to get data from user.
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
                .accessibilityLabel("Perfil do usuário")
        }
        .padding()
    }
}

#Preview {
    HomeHeaderView()
}
