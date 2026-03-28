//
//  AddressListView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 17/03/26.
//

import SwiftUI

struct AddressListView: View {
        @StateObject private var viewModel: AddressListViewModel
        
        init(user: User) {
            _viewModel = StateObject(wrappedValue: AddressListViewModel(user: user))
        }
        
        var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(viewModel.user.addresses) { address in
                        AddressListItemView(
                            address: address,
                            isActive: address.isActive,
                            onActivate: {
                                viewModel.activateAddress(address)
                            })
                    }
                }
                .padding()
            }
        }
    }
    
    #Preview {
        AddressListView(user: Mock().user)
    
    }
