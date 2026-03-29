//
//  User.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 17/03/26.
//

import Foundation

class User: ObservableObject {
    @Published var name: String
    @Published var addresses: [Address] = []
    @Published var activeAddress: Address?
    @Published var favoriteCupcakesIds: Array<String>
    
    init(name: String, addresses: [Address], favoriteCupcakesIds: [String] = []) {
        self.name = name
        self.addresses = addresses
        self.activeAddress = addresses.first(where: {$0.isActive})
        self.favoriteCupcakesIds = favoriteCupcakesIds
    }
}
