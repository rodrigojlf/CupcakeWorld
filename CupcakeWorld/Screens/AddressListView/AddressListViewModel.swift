//
//  AddressListViewModel.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 28/03/26.
//

import Foundation

@MainActor
final class AddressListViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func activateAddress(_ targetAddress: Address) {
        self.objectWillChange.send()
        if let targetIndex = user.addresses.firstIndex(where: { $0.id == targetAddress.id }) {
            
            for i in user.addresses.indices {
                user.addresses[i].isActive = (i == targetIndex)
            }
            
            user.activeAddress = user.addresses[targetIndex]
        }
    }
}
